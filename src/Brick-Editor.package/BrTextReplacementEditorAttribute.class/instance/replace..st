accessing
replace: aBrText
	| editor editorElement text |
		
	editor := BrTextEditor new.
	editor text: aBrText asString asRopedText.

	editorElement := BrEditorElement new.
	editorElement border: (BlBorder builder width: 2; paint: Color blue; build).
	editorElement constraintsDo: [ :c |
		c horizontal exact: 100.
		c vertical exact: 200 ].

	editorElement editor: editor.
	editorElement focusability: BlFocusability after.
	
	^ editorElement