accessing
rowValue: anObject at: aRowIndex
	| theCellElements |

	itemElement := self rowShapeBlock cull: anObject cull: self defaultRowElement.
	
	theCellElements := self columns withIndexCollect: [ :aListColumn :aColumnIndex |
		| aCellValue |
		aCellValue := aListColumn computeValue: anObject atRow: aRowIndex atColumn: aColumnIndex.
		aListColumn computeElement: aCellValue ].
	
	itemElement addChildren: theCellElements