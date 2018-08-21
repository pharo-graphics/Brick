api - activation
disabled: aBoolean
	aBoolean
		ifTrue: [ self disable ]
		ifFalse: [ self enable ]