examples - instance creation
listColumn
	<gtExample>
	| aListColumn |
	aListColumn := BrListColumn new.
	
	self assert: aListColumn title equals: 'Column'.
	self assert: aListColumn evaluated equals: #printString.
	
	^ aListColumn