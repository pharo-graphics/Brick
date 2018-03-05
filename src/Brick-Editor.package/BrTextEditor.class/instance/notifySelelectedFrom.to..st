event firing
notifySelelectedFrom: aFromIndex to: aToIndex
	self fireEvent: (BrTextEditorSelectedEvent new fromIndex: aFromIndex; toIndex: aToIndex)