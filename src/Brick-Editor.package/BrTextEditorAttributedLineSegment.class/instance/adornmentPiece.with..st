instance creation
adornmentPiece: aText with: anAdornmentAttribute
	"Create and return a segment piece with adornment"
	<return: #BrTextEditorAttributedLineSegmentPiece>

	^ BrTextEditorAttributedLineSegmentAdornmentPiece new
		text: aText;
		attribute: anAdornmentAttribute