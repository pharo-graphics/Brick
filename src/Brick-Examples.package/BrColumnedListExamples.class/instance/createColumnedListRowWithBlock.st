examples - stencil
createColumnedListRowWithBlock
	<gtExample>
	| aStencilBuilder aRowElement |
	
	aStencilBuilder := [ :aRowValue :aRowIndex | BlTextElement text: (aRowValue asString, '-', aRowIndex asString) asRopedText ] asStencil: BrListRowStencilBuilder.
	aStencilBuilder rowValue: 'Hello'.
	aStencilBuilder rowIndex: 1.
	
	aRowElement := aStencilBuilder build asElement.

	self assert: (aRowElement isKindOf: BlTextElement).
	self assert: aRowElement text asString equals: 'Hello-1'.
	
	^ aRowElement