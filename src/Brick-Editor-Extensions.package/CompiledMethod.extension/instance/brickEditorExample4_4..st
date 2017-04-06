*Brick-Editor-Extensions
brickEditorExample4_4: aComposite
	"<brickEditorOrder: 5>"

	aComposite text
		display: [ :aCompiledMethod |
			| text |
			text := (BrRopedText string: aCompiledMethod sourceCode)
				attributes: { BrFontFamilyAttribute named: 'Source Code Pro' }.
			text attributes: {
				BrTextBackgroundAttribute paint: Color yellow.
				BrTextDynamicReplaceAttribute new object: 13596723475/948126496712.
				 } from: 278 to: 285.
			text ];
		styler: (BrRBTextStyler new classOrMetaClass: self methodClass)