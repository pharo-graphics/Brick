examples - model
addColorNameColumn
	<gtExample>
	| aColumnedListModel |
	
	aColumnedListModel := self addColorIndexColumn.
	aColumnedListModel column
		title: 'Color';
		stencil: [ :aRowValue :aRowIndex | BrListLabelStencil new text: aRowValue name asString ].

	self assert: aColumnedListModel columns size equals: 2.
	self assert: aColumnedListModel columns second title equals: 'Color'.
		
	^ aColumnedListModel