*Brick-Editor-Extensions
brickEditorExample1_1: aComposite
	<brickEditorOrder: 90>

	aComposite text
		display: [ :aCompiledMethod |
			| text |
			text := (BrRopedText string: aCompiledMethod sourceCode)
				attributes: {
					BrFontFamilyAttribute named: 'Source Code Pro'.
					"BrFontSizeAttribute size: 20" }.
			text ];
		styler: (BrRBTextStyler new classOrMetaClass: self methodClass)