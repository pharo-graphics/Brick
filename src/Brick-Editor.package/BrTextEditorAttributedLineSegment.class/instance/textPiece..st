instance creation
textPiece: aText
	"Create and return a segment text piece"
	<return: #BrTextEditorLineSegmentPiece>

	^ BrTextEditorLineSegmentTextPiece new text: aText