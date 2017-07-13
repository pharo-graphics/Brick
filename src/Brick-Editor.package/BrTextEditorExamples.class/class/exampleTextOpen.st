examples
exampleTextOpen
	| space editorElement |
	
	editorElement := (self >> #element:editorText:) gtExample returnValue.
	editorElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].

	space := BlSpace new.
	space root addChild: editorElement.
	space show