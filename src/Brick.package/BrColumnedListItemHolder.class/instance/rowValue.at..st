api - binding
rowValue: anObject at: aRowIndex
	| theCellElements |

	itemElement := self rowStencil
		rowValue: anObject;
		rowIndex: aRowIndex;
		create.

	theCellElements := self columns withIndexCollect: [ :aListColumn :aColumnIndex |
		| aCellValue |
		aCellValue := aListColumn computeValue: anObject atRow: aRowIndex atColumn: aColumnIndex.
		aListColumn computeElement: aCellValue ].
	
	itemElement addChildren: theCellElements