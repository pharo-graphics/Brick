accessing
rowValue: anObject
	| theCellValues theCellElements |

	itemElement := self rowShapeBlock cull: anObject cull: self defaultRowElement.
	
	theCellValues := self columns collect: [ :aListColumn | aListColumn computeValue: anObject ].
	theCellElements := theCellValues collect: [ :aCelValue | self cellShapeBlock cull: anObject cull: self defaultCellElement ].
	
	itemElement addChildren: theCellElements