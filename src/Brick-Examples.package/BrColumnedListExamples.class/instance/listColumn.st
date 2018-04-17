examples - column
listColumn
	<gtExample>
	| aListColumn |
	aListColumn := BrListColumn new.
	
	self assert: aListColumn title equals: 'Column'.

	^ aListColumn