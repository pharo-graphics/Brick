examples - model
addColorNameColumn
	<gtExample>
	| aColumnedListModel |
	
	aColumnedListModel := self addColorIndexColumn.
	aColumnedListModel column
		title: 'Color';
		evaluated: #name;
		shape: [ :aString | BlElement new
			padding: (BlInsets left: 10);
			look: (BrLabelLook new text: aString) + BrLayoutLook frame matchParent + (BrLayoutLook of: #label) alignCenterLeft ].

	self assert: aColumnedListModel columns size equals: 2.
	self assert: aColumnedListModel columns second title equals: 'Color'.
	self assert: aColumnedListModel columns second evaluated equals: #name.
		
	^ aColumnedListModel