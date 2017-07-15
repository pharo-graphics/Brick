examples - comparison
exampleEditor
	| space editorElement editor text |
	
	editorElement := BrEditorElement new.
	editorElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	
	editor := BrTextEditor new.
	text := BrRopedText string: self loremIpsum.
	
	editor text: text.
	editorElement editor: editor.

	space := BlSpace new.
	space extent: self extent.
	space root addChild: editorElement.
	space show.
	editorElement inspect