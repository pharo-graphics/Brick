accessing
pieces
	<return: #Array of: #BrSubText>

	^ self hasPieces
		ifTrue: [ pieces ]
		ifFalse: [ self computedPieces ]