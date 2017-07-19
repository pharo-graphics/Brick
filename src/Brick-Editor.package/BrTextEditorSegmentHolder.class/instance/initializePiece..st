instance creation
initializePiece: aTextElement
	| aCursor |
	
	aTextElement editListener: self editor textEditListener.

	aCursor := self editor cursor.
	(aCursor insideSubText: aTextElement text of: segment)
		ifTrue: [
			aTextElement showCursorAt: aCursor position - aTextElement text start + 1.
			aTextElement requestFocus ]