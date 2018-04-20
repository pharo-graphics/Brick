api - binding
rowValue: anObject at: aRowIndex
	| theCellElements |

	itemElement := (self rowStencilBuilder
		rowValue: anObject;
		rowIndex: aRowIndex;
		build) asElement.

	theCellElements := self columns withIndexCollect: [ :aListColumn :aColumnIndex |	
		(aListColumn stencil
			rowValue: anObject;
			rowIndex: aRowIndex;
			columnIndex: aColumnIndex;
			build) asElement ].
	
	itemElement addChildren: theCellElements