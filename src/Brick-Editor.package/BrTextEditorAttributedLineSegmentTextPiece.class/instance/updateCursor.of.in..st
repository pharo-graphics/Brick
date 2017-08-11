cursor - management
updateCursor: aTextElement of: aLineSegment in: aTextEditor
	| aCursor cursorPosition |

	aCursor := aTextEditor cursor.
	
	(aCursor insideSubText: aTextElement text of: aLineSegment)
		ifFalse: [ ^ self ].

	cursorPosition := aTextElement text isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ aCursor position - aTextElement text start + 1 ].
			
	aTextElement showCursorAt: cursorPosition.
	aTextElement requestFocus