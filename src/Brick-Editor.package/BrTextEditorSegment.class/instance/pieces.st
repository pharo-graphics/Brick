accessing
pieces
	<return: #OrderedCollection>

	^ self hasPieces
		ifTrue: [ pieces ]
		ifFalse: [ self computedPieces ]