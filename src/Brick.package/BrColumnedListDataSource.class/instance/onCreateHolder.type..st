instance creation
onCreateHolder: anInfiniteElement type: anItemType
	^ BrColumnedListItemHolder new
		rowStencil: rowStencil;
		columns: columns