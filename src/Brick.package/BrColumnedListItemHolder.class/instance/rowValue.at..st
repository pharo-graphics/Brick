api - binding
rowValue: anObject at: aRowIndex
	| theCellElements |

	itemElement := self rowStencilBuilder
		rowValue: anObject;
		rowIndex: aRowIndex;
		create.

	theCellElements := self columns withIndexCollect: [ :aListColumn :aColumnIndex |	
		aListColumn stencil
			rowValue: anObject;
			rowIndex: aRowIndex;
			columnIndex: aColumnIndex;
			create ].
	
	itemElement addChildren: theCellElements