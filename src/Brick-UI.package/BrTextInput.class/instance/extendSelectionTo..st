selection
extendSelectionTo: aTextPosition
	self editorModel moveSelectionEndTo: aTextPosition.
	self selectionProperty notifyValueChanged