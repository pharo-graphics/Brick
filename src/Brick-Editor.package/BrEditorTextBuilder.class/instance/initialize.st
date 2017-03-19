initialization
initialize
	super initialize.
	
	segmentsBlock := #nextLine.
	segmentsIteratorBlock := #iterator.
	segmentsIteratorWhileBlock := #hasNext.
	
	itemsBlock := #nextWord.
	itemsIteratorBlock := #iterator.
	itemsIteratorWhileBlock := #hasNext