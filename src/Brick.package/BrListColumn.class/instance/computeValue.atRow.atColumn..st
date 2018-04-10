api - computing
computeValue: aRowValue atRow: aRowIndex atColumn: aCellIndex
	"Compute a cell value for a given row value based on current evaluation block"
	<return: #Object>

	^ self evaluated glamourValueWithArgs: { aRowValue . aRowIndex . aCellIndex }