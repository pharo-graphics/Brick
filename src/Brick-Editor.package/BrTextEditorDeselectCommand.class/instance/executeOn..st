executing
executeOn: aTextEditor

	aTextEditor selection deselect: self fromIndex to: self toIndex.
	aTextEditor update: self fromIndex to: self toIndex