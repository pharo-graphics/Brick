*Brick-Editor-Extensions
brickEditorMethodIn: aComposite
	<brickEditorOrder: 100>
	
	aComposite text
		display: [ :aCompiledMethod | BrRopedText string: self methodClass name, '>>#', self selector asString ].

	aComposite element
		display: [ BlElement new
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical exact: 2 ];
			background: Color gray ].

	aComposite text
		display: [ :aCompiledMethod |
			| text |
			text := (BrRopedText string: aCompiledMethod sourceCode)
				attributes: { BrFontFamilyAttribute named: 'Source Code Pro' }.
			"text attributes: { BrTextReplacementAttribute new } from: 19 to: 22."
			text ];
		styler: (BrRBTextStyler new classOrMetaClass: self methodClass)