examples
exampleTextOpen
	| space editorElement |
	
	editorElement := (self >> #elementWithEditor) gtExample returnValue.
	editorElement editor text attributes: {
		BrFontSizeAttribute size: 18.
		BrFontFamilyAttribute named: 'Helvetica Neue'.
	}.
	editorElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	editorElement addEventHandler: BrTextEditorSelectionHandler new.
	
	space := BlSpace new.
	space root addChild: editorElement.
	space root addEventHandler:
			(BlEventHandler
				on: BlDblClickEvent
				do: [ :evt | BlElementSelection on: evt target ]).
	space show