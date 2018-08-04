api - cursor
updateCursor: aTextElement of: aLineSegment in: anEditorElement
	| aCursor aCursorPosition hadCursor hasCursor oldCursor |
	
	aCursor := anEditorElement editor cursor.
	
	hadCursor := self hasCursor: anEditorElement.

	(aCursor insideSubText: self of: aLineSegment)
		ifFalse: [
			hadCursor
				ifTrue: [
					aTextElement dispatchEvent: (BrTextEditorHideCursorRequest new
						editorElement: anEditorElement;
						cursorPosition: currentCursor position).
					currentCursor := nil ].
			^ self ].

	oldCursor := currentCursor.
	hadCursor ifTrue: [
		aTextElement dispatchEvent: (BrTextEditorHideCursorRequest new
			editorElement: anEditorElement;
			cursorPosition: oldCursor position).
		currentCursor := nil ].

	currentCursor := aCursor copy.
	aCursorPosition := self globalTextIndexToLocal: aCursor position.
	currentCursor position: aCursorPosition.
	
	hasCursor := self hasCursor: anEditorElement.
	hasCursor
		ifTrue: [ aTextElement dispatchEvent: (BrTextEditorShowCursorRequest new
			editorElement: anEditorElement;
			hasFocus: anEditorElement hasFocus;
			cursorPosition: currentCursor position) ]