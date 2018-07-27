executing
executeOn: aTextEditor
	
	aTextEditor text
		delete: self fromIndex + 1
		to: self toIndex