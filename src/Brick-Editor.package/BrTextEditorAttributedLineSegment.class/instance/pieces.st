accessing
pieces
	<return: #Array of: #BrTextEditorAttributedLineSegmentPiece>

	^ self hasPieces
		ifTrue: [ pieces ]
		ifFalse: [ pieces := self computedPieces ]