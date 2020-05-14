Class {
	#name : #BrScrollbarOrientationModel,
	#superclass : #BrStateModel,
	#instVars : [
		'state'
	],
	#category : #'Brick-Scrollbar - Model'
}

{ #category : #testing }
BrScrollbarOrientationModel class >> canPropagateToChildren [
	<return: #Boolean>

	^ true
]

{ #category : #accessing }
BrScrollbarOrientationModel >> beHorizontal [
	self orientation: BrScrollbarOrientationState horizontal
]

{ #category : #accessing }
BrScrollbarOrientationModel >> beVertical [
	self orientation: BrScrollbarOrientationState vertical
]

{ #category : #initialization }
BrScrollbarOrientationModel >> initialize [
	super initialize.
	
	self beVertical
]

{ #category : #initialization }
BrScrollbarOrientationModel >> initializeListeners [
	super initializeListeners.
	
	self
		when: BrScrollbarOrientationRequest
		reply: [ :aResponse | aResponse orientation: self orientation ].
		
	self
		when: BrScrollbarOrientationWish
		do: [ :aWish | self orientation: aWish orientation ]
]

{ #category : #accessing }
BrScrollbarOrientationModel >> orientation [
	^ state
]

{ #category : #accessing }
BrScrollbarOrientationModel >> orientation: aBrScrollbarOrientation [
	state = aBrScrollbarOrientation
		ifTrue: [ ^ self ].

	state := aBrScrollbarOrientation.
	self notifyStateChanged: state
]

{ #category : #'state - accessing' }
BrScrollbarOrientationModel >> stateChangedEventClass [
	^ BrScrollbarOrientationChanged
]

{ #category : #'state - streaming' }
BrScrollbarOrientationModel >> streamStateIn: aBrInteractionStatesMapping [
	aBrInteractionStatesMapping
		addState: state
		model: self
]
