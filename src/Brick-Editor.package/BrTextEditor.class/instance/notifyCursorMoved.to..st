event firing
notifyCursorMoved: aFromIndex to: aToIndex
	self fireEvent: (BrTextEditorCursorMovedEvent from: aFromIndex to: aToIndex)