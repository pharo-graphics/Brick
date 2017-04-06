*Brick-Editor-Extensions
brickEditorTextElementOn: aBuilder
	<brickEditorElementOrder: 10>

	aBuilder dynamic
		element: [ BlElement new
			background: Color paleGreen;
			layout: BlLinearLayout vertical;
			addChildren: { BlTextElement new .
				BlElement new
					margin: (BlInsets top: 1 right: 0 bottom: 3 left: 0);
					background: Color darkGray;
					constraintsDo: [ :c |
						c horizontal matchParent.
						c vertical exact: 2 ]. BlTextElement new } ];
		bind: [ :anElement :aFraction |
			anElement children all first text: ((BrRopedText string: aFraction numerator asString)
				attributes: { BrFontFamilyAttribute named: 'Source Code Pro' }).
			anElement children all last text: ((BrRopedText string: aFraction denominator asString)
				attributes: { BrFontFamilyAttribute named: 'Source Code Pro' })
		];
		styled: [ :anElement |
			anElement constraintsDo: [ :c |
				c horizontal fitContent.
				c vertical fitContent ]
		]