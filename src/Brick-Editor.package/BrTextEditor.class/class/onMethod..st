instance creation
onMethod: aCompiledMethod
	| text styler editor editorElement |

	text := BlRopedText string: aCompiledMethod sourceCode.

	text attributes: {
		BrFontGenericFamilyAttribute monospace beNotOverwritableByStyler.
		(BrFontSizeAttribute size: 20) beNotOverwritableByStyler }.

	styler := BrRBTextStyler new.
	styler classOrMetaClass: aCompiledMethod methodClass.

	editor := BrTextEditor new.
	editor styler: styler.
	editor text: text.

	editorElement := BrEditorElement new.
	editorElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].

	editorElement editor: editor.

	^ editorElement