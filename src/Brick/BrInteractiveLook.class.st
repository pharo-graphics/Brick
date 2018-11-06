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
	#category : #'Brick-! Core'
}

{ #category : #initialization }
BrInteractiveLook >> buildStylesOn: aStyler [
	
]

{ #category : #'element handlers' }
BrInteractiveLook >> elementAddedToSuperParent: anEvent [
	self initializeRequests
]

{ #category : #initialization }
BrInteractiveLook >> initialize [
	super initialize.
	
	styles := OrderedCollection new
]

{ #category : #initialization }
BrInteractiveLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrInteractionChanged do: [ :anEvent | self statesChanged: anEvent ]
]

{ #category : #initialization }
BrInteractiveLook >> initializeLook [
	| aStyler |
	super initializeLook.
	
	aStyler := BrInteractiveCommonStyler new.
	self buildStylesOn: aStyler.
	
	styles addAllFirst: aStyler styles
]

{ #category : #initialization }
BrInteractiveLook >> initializeRequests [
	super initializeRequests.
	
	self statesChanged: (self request: BrInteractionRequest oneWay)
]

{ #category : #accessing }
BrInteractiveLook >> state [
	^ self subclassResponsibility
]

{ #category : #hooks }
BrInteractiveLook >> statesChanged: anEvent [

	styles
		select: [ :aStyle | aStyle state matches: anEvent states ]
		thenDo: [ :aStyle | aStyle action cull: self widget cull: aStyle state ]
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
