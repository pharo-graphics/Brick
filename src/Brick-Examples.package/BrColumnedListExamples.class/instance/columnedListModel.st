examples - instance creation
columnedListModel
	<gtExample>
	| aColumnedListModel |
	
	aColumnedListModel := BrColumnedListModel new.
	self assert: aColumnedListModel columns isEmpty.
	
	^ aColumnedListModel