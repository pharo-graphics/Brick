*Brick-Editor-Extensions
brickEditorMethodIn: aComposite
	<brickEditorOrder: 0>

	aComposite text
		display: [ :aCompiledMethod |
			| text |
			text := (BrRopedText string: aCompiledMethod sourceCode)
				attributes: { BrFontFamilyAttribute named: 'Source Code Pro' }.
			BrRBTextStyler new classOrMetaClass: aCompiledMethod methodClass; style: text.
			text ]