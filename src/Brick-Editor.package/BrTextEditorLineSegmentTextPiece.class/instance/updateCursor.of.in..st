cursor - management
updateCursor: aTextElement of: aLineSegment in: anEditorElement
	| aCursor cursorPosition |

	aCursor := anEditorElement editor cursor.
	
	(aCursor insideSubText: self of: aLineSegment)
		ifFalse: [ ^ self ].

	cursorPosition := aTextElement text isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ aCursor position - aTextElement text start + 1 ].

	aTextElement showCursorAt: cursorPosition.
	aTextElement requestFocus.

	"anEditorElement hasFocus
		ifTrue: [ aTextElement requestFocus ]"