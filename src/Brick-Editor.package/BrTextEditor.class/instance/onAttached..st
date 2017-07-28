hooks
onAttached: anEditorElement
	super onAttached: anEditorElement.
		
	anEditorElement addShortcut: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key s; build);
		action: [ self inform: 'Save!' ]) 