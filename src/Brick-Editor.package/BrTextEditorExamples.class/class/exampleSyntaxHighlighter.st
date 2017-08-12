examples
exampleSyntaxHighlighter
	| text styler editor editorElement space |
	text := BrRopedText string: (IntegerTest>>#testPositiveIntegerPrinting) sourceCode.
	text attributes: {
		BrFontGenericFamilyAttribute monospace beNotOverwritableByStyler.
		(BrFontSizeAttribute size: 14) beNotOverwritableByStyler }.

	styler := BrRBTextStyler new.
	styler classOrMetaClass: Morph.

	editor := BrTextEditor new.
	editor styler: styler.
	editor text: text.

	editorElement := BrEditorElement new.
	editorElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].

	editorElement editor: editor.

	space := BlSpace new.
	space root addChild: editorElement.
	space show