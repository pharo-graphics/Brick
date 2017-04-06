*Brick-Editor-Extensions
brickEditorExample1_2: aComposite
	"<brickEditorOrder: 80>"

	aComposite text
		display: [ :aCompiledMethod |
			| text |
			text := (BrRopedText string: aCompiledMethod sourceCode)
				attributes: { BrFontFamilyAttribute named: 'Source Code Pro' }.
			text attributes: {
				BrTextBackgroundAttribute paint: Color yellow.
				BrTextCsvAttribute new extent: 400@192 } from: 156 to: 200.
			text ];
		styler: (BrRBTextStyler new classOrMetaClass: self methodClass)