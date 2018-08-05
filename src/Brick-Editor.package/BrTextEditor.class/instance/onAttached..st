hooks
onAttached: anEditorElement
	super onAttached: anEditorElement.

	anEditorElement addEventHandler: BrTextEditorSelectionHandler new.
	anEditorElement addEventHandler: BrTextEditorInsertionHandler new.
	anEditorElement addEventHandler: BrTextEditorDeletionHandler new.

	self interactions do: [ :anInteraction | anEditorElement addShortcut: anInteraction ].

	anEditorElement when: BlMouseDownEvent do: [ :anEvent |
		anEvent currentTarget requestFocus.
		self selectNone ].
	anEditorElement when: BlFocusEvent do: [ self showCursor ].
	anEditorElement when: BlBlurEvent do: [ self hideCursor ].
	
	self notifyChanged