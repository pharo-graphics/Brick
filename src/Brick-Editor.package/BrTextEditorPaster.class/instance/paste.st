api - processing
paste
	| anInserter |
	
	anInserter := self editor inserter.
	anInserter text: text.
	anInserter shouldDeleteSelected: shouldDeleteSelected.
	anInserter shouldUpdateCursor: shouldUpdateCursor.
	anInserter shouldUpdateSelection: shouldUpdateSelection.
	insertionIndices do: [ :anIndex | anInserter at: anIndex ].

	anInserter insert