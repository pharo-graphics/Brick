examples - model
addColorValueColumn
	<gtExample>
	| aColumnedListModel |
	
	aColumnedListModel := self addColorNameColumn.
	aColumnedListModel column
		title: 'Hex';
		evaluated: #asHexString.
		
	self assert: aColumnedListModel columns size equals: 2.
	self assert: aColumnedListModel columns second title equals: 'Hex'.
	self assert: aColumnedListModel columns second evaluated equals: #asHexString.
		
	^ aColumnedListModel