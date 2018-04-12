examples - stencil
createColumnedListRowWithBlock
	<gtExample>
	| aStencil aRowElement |
	
	aStencil := [ :aRowValue :aRowIndex | BlTextElement text: (aRowValue asString, '-', aRowIndex asString) asRopedText ] asStencil: BrListRowStencil.
	aStencil rowValue: 'Hello'.
	aStencil rowIndex: 1.
	
	aRowElement := aStencil create.

	self assert: (aRowElement isKindOf: BlTextElement).
	self assert: aRowElement text asString equals: 'Hello-1'.
	
	^ aRowElement