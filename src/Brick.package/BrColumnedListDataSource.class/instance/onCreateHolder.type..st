instance creation
onCreateHolder: anInfiniteElement type: anItemType
	^ BrColumnedListItemHolder new
		rowShape: rowShapeBlock;
		columns: columns