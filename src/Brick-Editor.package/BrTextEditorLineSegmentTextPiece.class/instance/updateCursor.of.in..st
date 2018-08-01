api - cursor
updateCursor: aTextElement of: aLineSegment in: anEditorElement
	| aCursor aCursorPosition |

	aCursor := anEditorElement editor cursor.

	(aCursor insideSubText: self of: aLineSegment)
		ifFalse: [
			self hasCursor
				ifTrue: [
					aTextElement dispatchEvent: (BrTextEditorHideCursorRequest new
						editorElement: anEditorElement;
						cursorPosition: cursorPosition).
					cursorPosition := nil ].
			^ self ].

	aCursorPosition := self globalTextIndexToLocal: aCursor position.

	(self hasCursor and: [ aCursorPosition = cursorPosition ])
		ifTrue: [ ^ self ].

	self hasCursor
		ifTrue: [
			aTextElement dispatchEvent: (BrTextEditorHideCursorRequest new
				editorElement: anEditorElement;
				cursorPosition: cursorPosition).
			cursorPosition := nil ].

	cursorPosition := aCursorPosition.
	
	aTextElement dispatchEvent: (BrTextEditorShowCursorRequest new
		editorElement: anEditorElement;
		hasFocus: anEditorElement hasFocus;
		cursorPosition: aCursorPosition)