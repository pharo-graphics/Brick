*Brick-Editor-Extensions
brickEditorExample4_3: aComposite
	"<brickEditorOrder: 10>"

	aComposite text
		display: [ :aCompiledMethod |
			| text |
			text := (BrRopedText string: aCompiledMethod sourceCode)
				attributes: { BrFontFamilyAttribute named: 'Source Code Pro' }.
			text attributes: {
				BrTextFolderAttribute new path: '/users/syrel/Desktop'; extent: 400@150 } from: 383 to: 383.
			text ];
		styler: (BrRBTextStyler new classOrMetaClass: self methodClass)