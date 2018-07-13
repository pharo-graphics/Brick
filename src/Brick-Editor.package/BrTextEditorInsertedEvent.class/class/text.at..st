instance creation
text: aBlText at: anIndex
	<return: #BrTextEditorInsertedEvent>

	^ self new
		text: aBlText;
		index: anIndex