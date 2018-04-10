api - computing
computeElement: aCellValue default: aBlElement
	"Compute a cell element for a given cell value based on current shape block.
	List provides an optional default cell element, return it to have a default representation"
	<return: #BlElement>

	^ shapeBlock cull: aCellValue cull: aBlElement