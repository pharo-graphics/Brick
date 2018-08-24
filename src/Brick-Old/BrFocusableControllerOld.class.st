Class {
	#name : #BrFocusableControllerOld,
	#superclass : #BrInteractiveControllerOld,
	#category : 'Brick-Old'
}

{ #category : #'as yet unclassified' }
BrFocusableControllerOld >> isFocused [
	^ self hasActiveState: BlFocusedState
]

{ #category : #'as yet unclassified' }
BrFocusableControllerOld >> onBlur: anEvent [
	self deactivateState: BlFocusedState.
	self onStateChanged.
	super onBlur: anEvent
]

{ #category : #'as yet unclassified' }
BrFocusableControllerOld >> onFocus: anEvent [
	self activateState: BlFocusedState.
	self onStateChanged.
	^ super onFocus: anEvent
]

{ #category : #'as yet unclassified' }
BrFocusableControllerOld >> onMouseDown: anEvent [
	self isFocused
		ifFalse: [  widget requestFocus ].
	^ super onMouseDown: anEvent
]

{ #category : #'as yet unclassified' }
BrFocusableControllerOld >> wantsEvent: anEvent [
	(anEvent isBaseFocus or:[anEvent isMouseDown])
		ifTrue: [ ^  true  ].
	^ super wantsEvent: anEvent
]
