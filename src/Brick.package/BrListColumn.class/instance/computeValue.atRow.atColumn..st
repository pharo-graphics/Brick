api - computing
computeValue: aRowValue atRow: aRowIndex atColumn: aColumnIndex
	"Compute a cell value for a given row value based on current evaluation block"
	<return: #Object>

	^ self evaluationBlock glamourValueWithArgs: { aRowValue . aRowIndex . aColumnIndex }