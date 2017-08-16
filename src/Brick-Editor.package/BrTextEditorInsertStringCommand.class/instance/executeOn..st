executing
executeOn: aTextEditor
	
	aTextEditor text
		insertString: self string
		at: self index.
	
	aTextEditor segmentBuilder
		insertedString: self string
		at: self index
		in: aTextEditor