*Brick-Editor-Extensions
brickEditorExample3_3: aComposite
	"<brickEditorOrder: 40>"

	aComposite text
		display: [ :aCompiledMethod |
			| text |
			text := (BrRopedText string: aCompiledMethod sourceCode)
				attributes: { BrFontFamilyAttribute named: 'Source Code Pro' }.
			text attributes: {
				BrTextBackgroundAttribute paint: Color yellow.
				BrTextDateAttribute new extent: 180@160; date: Date today } from: 16 to: 20.
			text attributes: {
				BrTextReplaceAttribute new
					text: Date today printString;
					attributes: {
						BrTextBackgroundAttribute paint: Color green muchLighter } }
				from: 379 to: 383.
			text ];
		styler: (BrRBTextStyler new classOrMetaClass: self methodClass)