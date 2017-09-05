accessing
segment: anEditorSegment
	
	segment := anEditorSegment.

	pieces := segment pieces.
	pieceElements := pieces collect: [ :aPiece | aPiece createElement: self editor ].
	
	pieces
		with: pieceElements
		do: [ :aPiece :aPieceElement |
			aPiece updateCursor: aPieceElement of: anEditorSegment in: infiniteElement.
			aPiece updateSelection: aPieceElement of: anEditorSegment in: self editor ].
	
	itemElement removeChildren.
	itemElement addChildren: pieceElements.