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
		'styles'
	],
	#category : #'Brick-! Core - Looks'
}

{ #category : #initialization }
BrInteractiveLook >> initialize [
	super initialize.
	styles := OrderedCollection new.
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
	self when: BlElementAddedToSuperParentEvent do: [ :anEvent | self initializeRequests ]
]

{ #category : #initialization }
BrInteractiveLook >> initializeRequests [
	super initializeRequests.
	
	self requestStates
]

{ #category : #initialization }
BrInteractiveLook >> requestStates [
	self widgetDo: [ self statesChanged: (self request: BrInteractionRequest oneWay) ]
]

{ #category : #accessing }
BrInteractiveLook >> state [
	^ self subclassResponsibility
]

{ #category : #hooks }
BrInteractiveLook >> statesChanged: anEvent [
	| aWidget |
	
	aWidget := self widget.
	
	styles
		select: [ :aStyle | aStyle state matches: anEvent states ]
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
