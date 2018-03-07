as yet unclassified
onMouseDown: anEvent
	self isFocused
		ifFalse: [  widget requestFocus ].
	^ super onMouseDown: anEvent