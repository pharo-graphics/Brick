as yet unclassified
onMouseDown: anEvent
	(self isPressed not and: [ self isHovered ])
		ifTrue: [ self activateState: BlPressedState.
		self onStateChanged ].
	super onMouseDown: anEvent