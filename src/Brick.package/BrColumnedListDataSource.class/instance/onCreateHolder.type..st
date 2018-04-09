instance creation
onCreateHolder: anInfiniteElement type: anItemType
	^ BrColumnedListItemHolder new
		rowShape: rowShapeBlock;
		cellShape: cellShapeBlock;
		columns: columns