example
exampleText
	| space editorElement |
	space := BlSpace new
		extent: 800 @ 650;
		title: 'Moldable editor'.
	
	editorElement := BrEditorElement new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
		yourself.

	editorElement editor subject: (BrRopedText string: (Morph>>#fullDrawOn:) sourceCode).

	space root addChild: editorElement.
	space root addEventHandler:
			(BlEventHandler
				on: BlDblClickEvent
				do: [ :evt | BlElementSelection on: evt target ]).
	space show