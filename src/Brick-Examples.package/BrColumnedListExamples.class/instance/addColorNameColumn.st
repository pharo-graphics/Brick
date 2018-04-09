examples - model
addColorNameColumn
	<gtExample>
	| aColumnedListModel |
	
	aColumnedListModel := self columnedListModel.
	aColumnedListModel column
		title: 'Color';
		evaluated: #name.

	self assert: aColumnedListModel columns size equals: 1.
	self assert: aColumnedListModel columns first title equals: 'Color'.
	self assert: aColumnedListModel columns first evaluated equals: #name.
		
	^ aColumnedListModel