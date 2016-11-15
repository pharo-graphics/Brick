mouse handlers
mouseUpEvent: anEvent
	| txPos |
	"call controller for default mouse down behavior"
	super mouseUpEvent: anEvent.
	"convert event position to text position"
	(text containsGlobalPoint: anEvent position) ifFalse:[^ controller moveCaretToEnd].
	txPos := text  textPositionAt: (text globalPointToLocal: anEvent position).
	controller moveCaretTo: txPos
	