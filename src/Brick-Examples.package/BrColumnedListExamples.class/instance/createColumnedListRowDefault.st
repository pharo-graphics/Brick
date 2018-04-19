examples - stencil
createColumnedListRowDefault
	<gtExample>
	| aStencilBuilder aRowElement |
	
	aStencilBuilder := BrColumnedListRowStencil new.
	aStencilBuilder rowValue: 'Hello'.
	aStencilBuilder rowIndex: 1.
	
	aRowElement := aStencilBuilder build asElement.

	self assert: (aRowElement layout isKindOf: BlLinearLayout).
	self assert: (aRowElement layout isHorizontal).
	self assert: (aRowElement hasChildren not).
	
	^ aRowElement