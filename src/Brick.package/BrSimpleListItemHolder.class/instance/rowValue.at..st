api - binding
rowValue: anObject at: aRowIndex
	| aStencil |
	
	aStencil := self rowStencilBuilder
		rowValue: anObject;
		rowIndex: aRowIndex;
		build.

	itemElement := aStencil asElement