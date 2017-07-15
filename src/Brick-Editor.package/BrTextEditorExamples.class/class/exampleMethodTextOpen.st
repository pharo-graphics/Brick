examples
exampleMethodTextOpen
	| space editorElement |
	
	editorElement := (self >> #element:editorMethodText:) gtExample returnValue.
	editorElement editor text attributes: {
		BrFontSizeAttribute size: 18.
		BrFontGenericFamilyAttribute monospace
	}.
	editorElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].

	space := BlSpace new.
	space root addChild: editorElement.
	space show