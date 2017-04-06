*Brick-Editor-Extensions
brickEditorExample4_2: aComposite
	"<brickEditorOrder: 20>"

	aComposite text
		display: [ :aCompiledMethod |
			| text |
			text := (BrRopedText string: aCompiledMethod sourceCode)
				attributes: { BrFontFamilyAttribute named: 'Source Code Pro' }.
			text attributes: {
				BrTextBackgroundAttribute paint: Color yellow.
				BrTextPngUrlAttribute new
					append: false;
					url: 'file:///users/syrel/Desktop/Demo/connor-mcsheffrey-nature.jpg';
					extent: 300@300 } from: 9 to: 19.
			text attributes: {
				BrTextPngUrlAttribute new
					url: 'file:///users/syrel/Desktop/Demo/connor-mcsheffrey-nature.jpg';
					extent: 150@150 } from: 214 to: 214.
			text ];
		styler: (BrRBTextStyler new classOrMetaClass: self methodClass)