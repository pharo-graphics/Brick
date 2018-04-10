api - computing
computeElement: aCellValue
	"Compute a cell element for a given cell value based on current shape block.
	I provide an optional default cell element, users can simply return it to have a default representation"
	<return: #BlElement>

	^ shapeBlock cull: aCellValue cull: (self defaultCellElement: aCellValue)