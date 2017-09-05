instance creation
textPiece: aText
	"Create and return a segment text piece"
	<return: #BrTextEditorAttributedLineSegmentPiece>

	^ BrTextEditorAttributedLineSegmentTextPiece new
		text: aText