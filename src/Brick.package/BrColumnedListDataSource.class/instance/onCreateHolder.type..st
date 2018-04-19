instance creation
onCreateHolder: anInfiniteElement type: anItemType
	^ BrColumnedListItemHolder new
		rowStencilBuilder: rowStencil;
		columns: columns