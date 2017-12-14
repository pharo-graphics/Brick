accessing
pieces
	<return: #Array of: #BrTextEditorLineSegmentPiece>

	^ self hasPieces
		ifTrue: [ pieces ]
		ifFalse: [ pieces := self computedPieces ]