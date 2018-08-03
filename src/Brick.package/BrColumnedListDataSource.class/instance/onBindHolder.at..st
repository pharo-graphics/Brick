instance creation
onBindHolder: anElementHolder at: aPosition
	anElementHolder rowValue: (self rowValues at: aPosition) at: aPosition.

	super onBindHolder: anElementHolder at: aPosition