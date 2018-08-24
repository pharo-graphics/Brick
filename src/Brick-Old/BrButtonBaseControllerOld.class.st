Class {
	#name : #BrButtonBaseControllerOld,
	#superclass : #BrFocusableControllerOld,
	#category : 'Brick-Old'
}

{ #category : #'as yet unclassified' }
BrButtonBaseControllerOld >> isPressed [
	^ self hasActiveState: BlPressedState
]

{ #category : #'as yet unclassified' }
BrButtonBaseControllerOld >> onMouseDown: anEvent [
	(self isPressed not and: [ self isHovered ])
		ifTrue: [ self activateState: BlPressedState.
		self onStateChanged ].
	super onMouseDown: anEvent
]

{ #category : #'as yet unclassified' }
BrButtonBaseControllerOld >> onMouseUp: anEvent [
	(self isPressed and: [ self isHovered ]) ifTrue: [ 
		self deactivateState: BlPressedState.
		self onStateChanged ].
	^ super onMouseUp: anEvent
]

{ #category : #'as yet unclassified' }
BrButtonBaseControllerOld >> wantsEvent: anEvent [
	((anEvent isMouseUp or:[anEvent isMouseDown]) and:[self isHovered ]) ifTrue: [ ^  true].
	^ super wantsEvent: anEvent
]
