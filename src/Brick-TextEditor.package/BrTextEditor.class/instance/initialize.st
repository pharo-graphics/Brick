initialization
initialize
	| text |
	super initialize.

	text := BrRopedText string: (Morph>>#fullDrawOn:) sourceCode.
	BrRBTextStyler new classOrMetaClass: BrTextEditor; style: text.
	text attributes: { BrFontGenericFamilyAttribute monospace }.

	self subject: (MlRopeSubject new rope: text)