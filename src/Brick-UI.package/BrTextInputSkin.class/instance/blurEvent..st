focus handlers
blurEvent: anEvent
	caret stopBlinking.
	controller resetSelection.
	self showPlaceholder.
	super blurEvent: anEvent