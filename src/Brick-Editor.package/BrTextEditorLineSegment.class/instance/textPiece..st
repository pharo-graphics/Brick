instance creation
textPiece: aText
	"Create and return a text segment piece"
	<return: #BrTextEditorLineSegmentPiece>

	^ BrTextEditorLineSegmentTextPiece new text: aText