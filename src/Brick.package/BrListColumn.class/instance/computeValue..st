api - computing
computeValue: aRowValue
	"Compute a cell value for a given row value based on current evaluation block"
	<return: #Object>

	^ self evaluated cull: aRowValue