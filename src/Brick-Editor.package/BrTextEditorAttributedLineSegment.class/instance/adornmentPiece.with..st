instance creation
adornmentPiece: aText with: anAdornmentAttribute
	"Create and return a segment piece with adornment"
	<return: #BrTextEditorLineSegmentPiece>

	^ BrTextEditorAttributedLineSegmentAdornmentPiece new
		text: aText;
		adornmentAttribute: anAdornmentAttribute