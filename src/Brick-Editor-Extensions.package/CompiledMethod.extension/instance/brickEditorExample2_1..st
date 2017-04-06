*Brick-Editor-Extensions
brickEditorExample2_1: aComposite
	"<brickEditorOrder: 70>"

	aComposite text
		display: [ :aCompiledMethod |
			| text |
			text := (BrRopedText string: aCompiledMethod sourceCode)
				attributes: { BrFontFamilyAttribute named: 'Source Code Pro' }.
			text ];
		styler: (BrRBTextStyler new classOrMetaClass: self methodClass)