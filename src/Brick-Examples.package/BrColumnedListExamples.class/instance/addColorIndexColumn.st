examples - model
addColorIndexColumn
	<gtExample>
	| aColumnedListModel |
	
	aColumnedListModel := self columnedListModel.
	aColumnedListModel column
		title: 'Index';
		evaluated: [ :aColor :aRowIndex | aRowIndex ];
		shape: [ :aRowIndex | BlElement new
			constraintsDo: [ :c | c linear weight: 0.3 ];
			look: (BrLabelLook new text: aRowIndex asString; foreground: Color gray) + BrLayoutLook frame matchParent + (BrLayoutLook of: #label) alignCenter ].

	self assert: aColumnedListModel columns size equals: 1.
	self assert: aColumnedListModel columns first title equals: 'Index'.
		
	^ aColumnedListModel