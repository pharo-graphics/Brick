event firing
notifyInserted: aText at: aTextIndex
	self fireEvent: (BrTextEditorInsertedEvent new text: aText; index: aTextIndex)