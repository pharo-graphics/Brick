*Brick-Editor-Extensions
brickEditorMethodsIn: aComposite
	<brickEditorOrder: 0>

	aComposite repeat
		display: [ :aClass | aClass methods sorted: [ :a :b | a selector < b selector ] ];
		text: [ :aBuilder | aBuilder
			display: [ :aCompiledMethod |
				| text |
				text := (BrRopedText string: aCompiledMethod sourceCode)
					attributes: { BrFontFamilyAttribute named: 'Source Code Pro' }.
				BrRBTextStyler new classOrMetaClass: aCompiledMethod methodClass; style: text.
				text ] ]