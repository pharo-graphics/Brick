*Brick-Editor-Extensions
brickEditorExample3_2: aComposite
	"<brickEditorOrder: 60>"

	aComposite text
		display: [ :aCompiledMethod |
			| text |
			text := (BrRopedText string: aCompiledMethod sourceCode)
				attributes: { BrFontFamilyAttribute named: 'Source Code Pro' }.
			text attributes: {
				BrTextBackgroundAttribute paint: Color yellow.
				BrTextPngUrlAttribute new } from: 245 to: 295.
			text ];
		styler: (BrRBTextStyler new classOrMetaClass: self methodClass)