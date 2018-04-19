examples - model
addColorValueColumn
	<gtExample>
	| aColumnedListModel |
	
	aColumnedListModel := self addColorNameColumn.
	aColumnedListModel column
		title: 'Hex';
		stencil: [ :aRowValue |
			| aHexString |
			
			aHexString := aRowValue asHexString.
			
			BlElement new
				padding: (BlInsets all: 6);
				margin: (BlInsets top: 3 left: 0 bottom: 3 right: 0);
				background: (Color fromHexString: aHexString);
				look: (BrLabelLook new text: '#',aHexString; thin; foreground: ((Color fromHexString: aHexString) contrastingColor)) + (BrLayoutLook frame hMatchParent; vFitContent) + (BrLayoutLook of: #label) alignCenter ].
		
	self assert: aColumnedListModel columns size equals: 3.
	self assert: aColumnedListModel columns third title equals: 'Hex'.
		
	^ aColumnedListModel