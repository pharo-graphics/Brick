example
ropeTree
	"Rope tree demo"

	^ self stepping: {
		'text := ''The moldable editor'' asRopedText.'.
		'text attributes: { BrFontSizeAttribute size: 20 }.'.
		'text insertString: '' can be adapted'' at: text size.'.
		'text insertString: '' to the context.'' at: text size.'.
		'text 
	attributes: { 
		BrFontGenericFamilyAttribute monospace . 
		BrTextForegroundAttribute paint: Color blue } 
	from: 5
	to: 12.'.
	'text
	attributes: { BrFontGenericFamilyAttribute monospace } 
	from: 43
	to: 49'
	}