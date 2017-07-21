examples
exampleTextOpen
	| space editorElement |
	
	editorElement := (self >> #element:editorText:) gtExample returnValue.
	editorElement editor text attributes: {
		BrFontSizeAttribute size: 18.
		BrFontFamilyAttribute named: 'Helvetica Neue'.
	}.
	editorElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].

	space := BlSpace new.
	space root addChild: editorElement.
	space show