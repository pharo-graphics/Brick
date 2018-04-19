examples - instance creation
listLabelStencil
	<gtExample>
	| aStencil |
	
	aStencil := BrListLabelStencil new.
	self assert: aStencil text asString equals: 'Label'.

	^ aStencil