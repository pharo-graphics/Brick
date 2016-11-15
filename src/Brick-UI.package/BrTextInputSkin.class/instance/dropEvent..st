dnd handlers
dropEvent: anEvent
	| evtPos aTextPosition |
	evtPos := textContainer globalPointToLocal: anEvent position.
	aTextPosition := text textPositionAt: evtPos - self textOffset.
	anEvent dragboard hasClipData ifTrue: [ 
		controller deleteSelection.
		controller moveCaretTo: aTextPosition.
		controller insertText: anEvent dragboard clipData asString. ]
			