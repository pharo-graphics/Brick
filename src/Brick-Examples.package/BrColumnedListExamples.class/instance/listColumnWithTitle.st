examples - column
listColumnWithTitle
	<gtExample>
	| aListColumn |
	
	aListColumn := self listColumn.
	aListColumn title: 'Custom property'.
	
	self assert: aListColumn title equals: 'Custom property'.
	
	^ aListColumn