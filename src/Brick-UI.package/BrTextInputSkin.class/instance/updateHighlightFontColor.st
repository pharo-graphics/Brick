updating
updateHighlightFontColor
	"text updateTextModelFill.
	widget editorModel selection
		applyAttribute: (TxForeColorAttribute with: widget highlightFontColor)"