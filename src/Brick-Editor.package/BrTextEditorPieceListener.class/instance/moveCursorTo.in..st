cursor - management
moveCursorTo: aTextIndex in: aTextElement
	self editor moveCursorTo: ((aTextElement text start + aTextIndex - 1) max: 0)