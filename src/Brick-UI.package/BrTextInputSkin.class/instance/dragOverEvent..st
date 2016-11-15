dnd handlers
dragOverEvent: anEvent
	| aTextPosition evtPos |
	evtPos := (textContainer globalPointToLocal: anEvent position).
	aTextPosition := text textPositionAt: evtPos.
	anEvent dragboard hasClipData ifTrue: [ 
		widget requestFocus.
		self moveCaretCursorTo: aTextPosition ]