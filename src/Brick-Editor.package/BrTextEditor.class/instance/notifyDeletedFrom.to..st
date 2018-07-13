event firing
notifyDeletedFrom: aFromIndex to: aToIndex
	self fireEvent: (BrTextEditorDeletedEvent from: aFromIndex to: aToIndex)