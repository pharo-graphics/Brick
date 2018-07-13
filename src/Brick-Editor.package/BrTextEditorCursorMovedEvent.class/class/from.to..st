instance creation
from: anOldIndex to: aNewIndex
	<return: #BrTextEditorCursorMovedEvent>

	^ self new
		oldIndex: anOldIndex;
		newIndex: aNewIndex