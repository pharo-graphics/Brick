accessing
segment: anEditorSegment
	
	segment := anEditorSegment.

	pieces := segment pieces.
	pieceElements := pieces collect: [ :aPiece | aPiece createElement: self infiniteElement ].
	
	pieces
		with: pieceElements
		do: [ :aPiece :aPieceElement |
			aPiece updateCursor: aPieceElement of: anEditorSegment in: self infiniteElement.
			aPiece updateSelection: aPieceElement of: anEditorSegment in: self infiniteElement ].
	
	itemElement removeChildren.
	itemElement addChildren: pieceElements