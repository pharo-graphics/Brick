initialization
initialize
	| text |
	super initialize.

	text := BrRopedText string: (Morph>>#fullDrawOn:) sourceCode.
	BrRBTextStyler new classOrMetaClass: Morph; style: text.
	"text attributes: { BrFontGenericFamilyAttribute monospace }."
	text attributes: { BrFontFamilyAttribute named: 'Source Code Pro' }.

	self subject: (MlRopeSubject new rope: text)