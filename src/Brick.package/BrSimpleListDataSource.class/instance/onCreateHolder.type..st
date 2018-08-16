instance creation
onCreateHolder: anInfiniteElement type: anItemType
	^ BrSimpleListItemHolder new
		listElement: self listElement;
		rowStencilBuilder: rowStencil