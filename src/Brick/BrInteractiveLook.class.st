"
Example:

[[[
 BrInteractiveLook new style: [ :aStyler |
	aStyler default: [ self foreground: BrGlamorousColors defaultButtonTextColor ].
	aStyler hovered: [ self foreground: BrGlamorousColors hoveredButtonTextColor ].
	aStyler pressed: [ self foreground: BrGlamorousColors pressedButtonTextColor ].
	aStyler disabled: [ self foreground: BrGlamorousColors disabledButtonTextColor ] ]
]]]
"
Class {
	#name : #BrInteractiveLook,
	#superclass : #BrLook,
	#instVars : [
		'styles',
		'currentStates'
	],
	#category : #'Brick-! Core - Looks'
}

{ #category : #'gt-extension' }
BrInteractiveLook >> gtStylesFor: aView [
	<gtView>
	
	^ aView columnedList
		title: 'Styles';
		priority: 3;
		items: [ self styles ];
		column: 'State' item: [ :eachItem | eachItem state ] width: 200;
		column: 'Action' item: [ :eachItem | eachItem action ]
		
]

{ #category : #initialization }
BrInteractiveLook >> initialize [
	super initialize.
	
	styles := OrderedCollection new.
	currentStates := #().
	
	self
		addChange:
			(BrLookChange new
				up: [ :e | styles addAllFirst: BrInteractiveCommonStyler new styles ];
				down: [ :e |  ];
				yourself)
]

{ #category : #initialization }
BrInteractiveLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrInteractionChanged do: [ :anEvent | self statesChanged: anEvent ].
	self when: BlElementAddedToSuperParentEvent do: [ :anEvent | self requestStates ]
]

{ #category : #initialization }
BrInteractiveLook >> initializeRequests [
	super initializeRequests.

	self request: BrInteractionRequest new
]

{ #category : #initialization }
BrInteractiveLook >> requestStates [
	self widgetDo: [ :aWidget |
		aWidget telemetry
			timeSync: [ 'Request states for interactive look {1}' format: { aWidget } ]
			during: [ self statesChanged: (self request: (BrInteractionRequest oneWay forceUpdate: true)) ] ]
]

{ #category : #accessing }
BrInteractiveLook >> state [
	^ self subclassResponsibility
]

{ #category : #hooks }
BrInteractiveLook >> statesChanged: anEvent [
	| aWidget newStates |

	aWidget := self widget.
	newStates := anEvent states.

	(anEvent forceUpdate not and: [ currentStates = newStates ])
		ifTrue: [ ^ self ].

	currentStates := newStates.
	styles
		select: [ :aStyle | aStyle state matches: currentStates ]
		thenDo: [ :aStyle | aStyle action cull: aWidget cull: aStyle state ]
]

{ #category : #'api - style' }
BrInteractiveLook >> style: aBlock [
	aBlock value: (BrInteractiveCommonStyler on: self)
]

{ #category : #private }
BrInteractiveLook >> styles [
	<return: #Collection of: #BrInteractiveStyle>
	
	^ styles
]

{ #category : #builder }
BrInteractiveLook >> when: aStateBlock style: aStyleBlock [
	| aTargetState |
	
	aTargetState := aStateBlock glamourValueWithArgs: { self state }.
	self styles add: (BrInteractiveStyle new state: aTargetState; action: aStyleBlock)
]
