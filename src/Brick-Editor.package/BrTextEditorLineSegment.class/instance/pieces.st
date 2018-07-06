accessing
pieces
	<return: #Array of: #BlSubText>

	^ self hasPieces
		ifTrue: [ pieces ]
		ifFalse: [ pieces := self computedPieces ]