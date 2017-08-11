cursor / selection
updateCursor: aCollectionOfTextElements
	| aCursor |
	
	aCursor := self editor cursor.
	
	aCollectionOfTextElements
		detect: [ :aTextElement | aCursor insideSubText: aTextElement text of: segment ]
		ifFound: [ :aTextElement |
			| cursorPosition |
			cursorPosition := aTextElement text isEmpty
				ifTrue: [ 0 ]
				ifFalse: [ aCursor position - aTextElement text start + 1 ].
			
			aTextElement showCursorAt: cursorPosition.
			aTextElement requestFocus ]