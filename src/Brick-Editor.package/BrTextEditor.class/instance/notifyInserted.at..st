event firing
notifyInserted: aText at: aTextIndex
	self fireEvent: (BrTextEditorInsertedEvent text: aText at: aTextIndex)