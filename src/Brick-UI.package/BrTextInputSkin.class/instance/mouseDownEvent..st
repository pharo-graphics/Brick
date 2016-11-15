mouse handlers
mouseDownEvent: anEvent
	| txPos |
	"call controller for default mouse down behavior"
	super mouseDownEvent: anEvent.
	"convert event position to text position"
	(text containsGlobalPoint: anEvent position) ifFalse:[^ controller moveCaretToEnd].
	
	txPos := text  textPositionAt: (text globalPointToLocal: anEvent position).
	anEvent primaryButtonPressed ifTrue: [ 
		"call controller to update model"
		anEvent modifiers isShift ifTrue:[ ^ controller extendSelectionTo: txPos ].
		"if txPos is in a selection, selection may be dragged"
		(widget editorModel selection contains: txPos)  ifTrue:[^ self].
		"else, just move the caret"
		controller moveCaretTo: txPos ]
	