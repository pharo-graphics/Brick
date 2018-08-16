api - binding
rowValue: anObject at: aRowIndex
	| aStencil |
	
	rowValue := anObject.
	
	aStencil := self rowStencilBuilder
		rowValue: anObject;
		rowIndex: aRowIndex;
		build.

	itemElement := aStencil asElement