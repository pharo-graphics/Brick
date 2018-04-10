examples - column
listColumnComputeValueDefault
	<gtExample>
	| aListColumn aCellValue |
	
	aListColumn := self listColumn.
	aCellValue := aListColumn computeValue: 1337 atRow: 1 atColumn: 1.

	self assert: aCellValue equals: '1337'.

	^ aListColumn