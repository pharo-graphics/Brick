hooks
onAttached: anEditorElement
	super onAttached: anEditorElement.
	
	"anEditorElement addEventHandler: BrTextEditorSelectionHandler new."

	self interactions do: [ :anInteraction | anEditorElement addShortcut: anInteraction ].

	anEditorElement addEventHandlerOn: BlMouseDownEvent do: [ self selectNone ]