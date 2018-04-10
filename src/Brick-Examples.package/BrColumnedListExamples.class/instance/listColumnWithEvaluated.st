examples - column
listColumnWithEvaluated
	<gtExample>
	| aListColumn |
	
	aListColumn := self listColumn.
	aListColumn evaluated: [ :aRowValue :aRowIndex :aColumnIndex | { aRowValue . aRowIndex . aColumnIndex } ].
	
	self
		assert: (aListColumn computeValue: 1337 atRow: 1 atColumn: 2)
		equals: { 1337 . 1 . 2 }.
	
	^ aListColumn