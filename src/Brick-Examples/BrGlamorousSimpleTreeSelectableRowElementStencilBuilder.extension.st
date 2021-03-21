Extension { #name : #BrGlamorousSimpleTreeSelectableRowElementStencilBuilder }

{ #category : #'*Brick-Examples' }
BrGlamorousSimpleTreeSelectableRowElementStencilBuilder class >> simpleTreeExample [
	<gtExample>
	
	^ BrSimpleTreeExamples new subclassesOfCollection
		rowStencil: (BrGlamorousSimpleTreeSelectableRowElementStencilBuilder new
			"adds a bit of space to the left from the expander triangle"
			padding: (BlInsets left: 5));
		expandUpTo: 2
]
