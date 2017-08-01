examples
exampleMethodTextOpen
	| space editorElement |

	editorElement := (self >> #element:editorMethodText:) gtExample returnValue.
	editorElement editor text attributes: {
		BrFontSizeAttribute size: 18.
		BrFontGenericFamilyAttribute monospace
	}.
	"editorElement editor selection interval: (35 to: 140)."
	editorElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	
	editorElement addEventHandler: BlSelectionHandler new.

	space := BlSpace new.
	space extent: 800@400.
	space root addChild: editorElement.
	space show.
	
	"editorElement inspect"