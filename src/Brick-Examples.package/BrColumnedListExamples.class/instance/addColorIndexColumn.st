examples - model
addColorIndexColumn
	<gtExample>
	| aColumnedListModel |

	aColumnedListModel := self columnedListModel.
	aColumnedListModel column
		title: 'Index';
		stencil: [ :aRowValue :aRowIndex | BrListLabelStencil new text: aRowIndex asString ].

	self assert: aColumnedListModel columns size equals: 1.
	self assert: aColumnedListModel columns first title equals: 'Index'.

	^ aColumnedListModel