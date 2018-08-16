instance creation
onCreateHolder: anInfiniteElement type: anItemType
	^ BrColumnedListItemHolder new
		listElement: self listElement;
		rowStencilBuilder: rowStencil;
		columns: columns