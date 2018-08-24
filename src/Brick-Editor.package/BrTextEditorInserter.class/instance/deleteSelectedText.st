private
deleteSelectedText
	| aDeleter newInsertionIndices |
	
	aDeleter := self editor deleter.
	aDeleter selected.

	newInsertionIndices := SortedCollection new.
	insertionIndices do: [ :anIndex |
		newInsertionIndices add: (anIndex + (aDeleter computeIndexMovement: anIndex)) ].
	
	insertionIndices := newInsertionIndices.
	
	aDeleter delete