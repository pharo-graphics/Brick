cursor - management
moveCursorTo: aTextIndex in: aTextElement
	super moveCursorTo: aTextIndex in: aTextElement.
	
	self editor movedCursorTo: aTextElement text start + aTextIndex - 1