instance creation
from: aFromIndex to: aToIndex
	<return: #BrTextEditorCursorMovedEvent>

	^ self new
		fromIndex: aFromIndex;
		toIndex: aToIndex