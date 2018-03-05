event firing
notifyDeletedFrom: aFromIndex to: aToIndex
	self fireEvent: (BrTextEditorDeletedEvent new fromIndex: aFromIndex; toIndex: aToIndex)