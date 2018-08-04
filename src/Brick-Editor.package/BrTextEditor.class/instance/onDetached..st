hooks
onDetached: anEditorElement
	super onDetached: anEditorElement.

	anEditorElement removeEventHandlersSuchThat: [ :aHandler | aHandler isKindOf: BrTextEditorSelectionHandler ].
	anEditorElement removeEventHandlersSuchThat: [ :aHandler | aHandler isKindOf: BrTextEditorInsertionHandler ].
	anEditorElement removeEventHandlersSuchThat: [ :aHandler | aHandler isKindOf: BrTextEditorDeletionHandler ].

	self interactions do: [ :anInteraction | anEditorElement removeShortcut: anInteraction ].

	anEditorElement
		removeEventHandlersSuchThat: [ :aHandler | (aHandler isKindOf: BlEventHandler)
			and: [ { BlMouseDownEvent . BlFocusEvent . BlBlurEvent } includes: aHandler eventClass ] ]