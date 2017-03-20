*Brick-Editor-Extensions
brickEditorMethodIn: aComposite
	<brickEditorOrder: 0>
	
	aComposite text
		inline;
		display: [ :aCompiledMethod | BrRopedText string: self methodClass name, '>>#', self selector asString ].

	aComposite element
		display: [ BlElement new
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical exact: 2 ];
			background: Color gray ].

	aComposite element
		display: [ BlElement new
			size: 60@20;
			margin: (BlInsets all: 3);
			background: Color green ].

	aComposite text
		inline;
		display: [ :aCompiledMethod |
			| text |
			text := (BrRopedText string: aCompiledMethod sourceCode)
				attributes: { BrFontFamilyAttribute named: 'Source Code Pro' }.
			BrRBTextStyler new classOrMetaClass: aCompiledMethod methodClass; style: text.
			text ].

	aComposite element
		display: [ BlElement new
			size: 60@20;
			margin: (BlInsets all: 3);
			background: Color blue ];
		inline.

	aComposite element
		display: [ BlTextElement new
			text: (BrRopedText string: 'I am a snippet visualisation');
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical exact: 150.
				c margin: (BlInsets all: 15) ];
			background: Color paleOrange ].