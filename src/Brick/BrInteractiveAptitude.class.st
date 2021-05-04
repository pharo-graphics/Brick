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
	#name : #BrInteractiveAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'styles',
		'currentStates'
	],
	#category : #'Brick-! Deprecated'
}

{ #category : #testing }
BrInteractiveAptitude class >> isDeprecated [
	^ true
]

{ #category : #initialization }
BrInteractiveAptitude >> initialize [
	super initialize.
	
	styles := OrderedCollection new.
	currentStates := #().
	
	self
		addChange:
			(BrLookChange new
				up: [ :e | styles ];
				down: [ :e |  ];
				yourself)
]

{ #category : #initialization }
BrInteractiveAptitude >> initializeListeners [
	super initializeListeners.
	
	self when: BrInteractionChanged do: [ :anEvent | self statesChanged: anEvent ]
]

{ #category : #initialization }
BrInteractiveAptitude >> initializeRequests [
	super initializeRequests.

	self request: BrInteractionRequest new
]

{ #category : #initialization }
BrInteractiveAptitude >> requestStates [
	self widgetDo: [ :aWidget |
		aWidget telemetry
			timeSync: [ 'Request states for interactive look {1}' format: { aWidget } ]
			during: [ self statesChanged: (self request: (BrInteractionRequest oneWay forceUpdate: true)) ] ]
]

{ #category : #accessing }
BrInteractiveAptitude >> state [
	^ self subclassResponsibility
]

{ #category : #hooks }
BrInteractiveAptitude >> statesChanged: anEvent [
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
BrInteractiveAptitude >> style: aBlock [
	aBlock value: (BrInteractiveCommonStyler on: self)
]

{ #category : #private }
BrInteractiveAptitude >> styles [
	<return: #Collection of: #BrInteractiveStyle>
	
	^ styles
]

{ #category : #builder }
BrInteractiveAptitude >> when: aStateBlock style: aStyleBlock [
	| aTargetState |
	
	aTargetState := aStateBlock glamourValueWithArgs: { self state }.
	self styles add: (BrInteractiveStyle new state: aTargetState; action: aStyleBlock)
]
