examples - stencil
createColumnedListRowDefault
	<gtExample>
	| aStencil aRowElement |
	
	aStencil := BrColumnedListRowStencil new.
	aStencil rowValue: 'Hello'.
	aStencil rowIndex: 1.
	
	aRowElement := aStencil create.

	self assert: (aRowElement layout isKindOf: BlLinearLayout).
	self assert: (aRowElement layout isHorizontal).
	self assert: (aRowElement hasChildren not).
	
	^ aRowElement