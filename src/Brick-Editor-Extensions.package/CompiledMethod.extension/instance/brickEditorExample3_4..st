*Brick-Editor-Extensions
brickEditorExample3_4: aComposite
	"<brickEditorOrder: 30>"

	aComposite text
		display: [ :aCompiledMethod |
			| text |
			text := (BrRopedText string: aCompiledMethod sourceCode)
				attributes: { BrFontFamilyAttribute named: 'Source Code Pro' }.
			text attributes: {
				BrTextCsvAttribute new
					url: 'file:///users/syrel/Desktop/Demo/messages.csv';
					extent: 400@100.  } from: 270 to: 270.
			text attributes: {
				BrTextBackgroundAttribute paint: Color yellow.
				BrTextCsvAttribute new
					url: 'file:///users/syrel/Desktop/Demo/messages-grouped.csv';
					extent: 290@100;
					append: false. }
					from: 294 to: 386.
			text ];
		styler: (BrRBTextStyler new classOrMetaClass: self methodClass)