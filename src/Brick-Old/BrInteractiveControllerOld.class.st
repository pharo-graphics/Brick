Class {
	#name : #BrInteractiveControllerOld,
	#superclass : #BrControllerOld,
	#category : 'Brick-Old'
}

{ #category : #'as yet unclassified' }
BrInteractiveControllerOld >> isDisabled [
	^ self hasActiveState: BlDisabledState
]

{ #category : #'as yet unclassified' }
BrInteractiveControllerOld >> isHovered [
	^ self hasActiveState: BlHoveredState
]

{ #category : #'as yet unclassified' }
BrInteractiveControllerOld >> onMouseEnter: anEvent [
	self activateState: BlHoveredState.
	self onStateChanged.
	super onMouseEnter: anEvent
]

{ #category : #'as yet unclassified' }
BrInteractiveControllerOld >> onMouseLeave: anEvent [
	self deactivateState: BlPressedState.
	self deactivateState: BlHoveredState.
	self onStateChanged.
	super onMouseLeave: anEvent
]

{ #category : #'as yet unclassified' }
BrInteractiveControllerOld >> wantsEvent: anEvent [
	self isDisabled ifTrue:[^ false].
	anEvent isMouseLeave
		ifTrue: [ ^  self isHovered ].
	anEvent isMouseEnter ifTrue:[^ true].
	^ super wantsEvent: anEvent
]
