hooks
onAttached: anEditorElement
	super onAttached: anEditorElement.

	anEditorElement addEventHandler: BrTextEditorSelectionHandler new.
	anEditorElement addEventHandler: BrTextEditorInsertionHandler new.
	anEditorElement addEventHandler: BrTextEditorDeletionHandler new.

	self interactions do: [ :anInteraction | anEditorElement addShortcut: anInteraction ].

	anEditorElement when: BlMouseDownEvent do: [ self selectNone ].
	
	self notifyChanged