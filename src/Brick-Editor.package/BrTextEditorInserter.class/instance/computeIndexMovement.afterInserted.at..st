private
computeIndexMovement: anIndex afterInserted: aText at: anInsertionIndex
	"Compute by how much a given text index should be moved after a privided text is inserted at a given insertion index"
	<return: #Number>

	^ anIndex < anInsertionIndex
		ifTrue: [ 0 ]
		ifFalse: [ aText size ]