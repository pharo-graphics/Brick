binding
bind: aTextEditorSegment

	pieces := segment pieces.
	pieceElements := pieces collect: [ :aText | self createPiece: aText ].
	itemElement removeChildren.
	itemElement addChildren: pieceElements