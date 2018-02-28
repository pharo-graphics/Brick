executing
executeOn: aTextEditor
	
	aTextEditor text
		delete: self fromIndex
		to: self toIndex.
	
	aTextEditor segmentBuilder
		deletedFrom: self fromIndex
		to: self toIndex
		in: aTextEditor.

	aTextEditor segmentBuilder validateIntegrity: aTextEditor.

	aTextEditor notifyDeletedFrom: self fromIndex to: self toIndex