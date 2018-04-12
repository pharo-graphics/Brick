accessing
pieces
	<return: #Array of: #BrSubText>

	^ self hasPieces
		ifTrue: [ pieces ]
		ifFalse: [ pieces := self computedPieces ]