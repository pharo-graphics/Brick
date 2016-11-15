focus handlers
focusEvent: anEvent
	super focusEvent: anEvent.
	self hidePlaceholder.
	caret startBlinking.
	controller moveCaretToLineStart