api - configuration
at: anIndex
	"Add a given index as another text insertion location"

	(insertionIndices includes: anIndex)
		ifFalse: [ insertionIndices add: anIndex ]