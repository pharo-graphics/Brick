api - processing
insert
	shouldDeleteSelected
		ifTrue: [ self deleteSelectedText ].
		
	insertionIndices reverseDo: [ :anIndex |
		self insertString: text at: anIndex.

		shouldUpdateCursor
			ifTrue: [ self updateCursorAfterInsertion: text at: anIndex ].
		shouldUpdateSelection
			ifTrue: [ self updateSelectionAfterInsertion: text at: anIndex ] ]