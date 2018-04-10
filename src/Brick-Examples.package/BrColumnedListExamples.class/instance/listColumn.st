examples - column
listColumn
	<gtExample>
	| aListColumn |
	aListColumn := BrListColumn new.
	
	self assert: aListColumn title equals: 'Column'.
	self assert: aListColumn evaluationBlock equals: #printString.

	^ aListColumn