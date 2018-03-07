as yet unclassified
onMouseUp: anEvent
	(self isPressed and: [ self isHovered ]) ifTrue: [ 
		self deactivateState: BlPressedState.
		self onStateChanged ].
	^ super onMouseUp: anEvent