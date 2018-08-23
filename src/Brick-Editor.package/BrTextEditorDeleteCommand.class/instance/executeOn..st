executing
executeOn: aTextEditor
	
	aTextEditor text
		delete: ((self fromIndex + 1) min: self toIndex)
		to: self toIndex