api - cursor
hasCursor: anEditorElement
	<return: #Boolean>

	^ currentCursor isNotNil and: [ currentCursor isVisible ]