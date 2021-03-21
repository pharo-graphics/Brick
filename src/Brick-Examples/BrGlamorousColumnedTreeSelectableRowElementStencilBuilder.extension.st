Extension { #name : #BrGlamorousColumnedTreeSelectableRowElementStencilBuilder }

{ #category : #'*Brick-Examples' }
BrGlamorousColumnedTreeSelectableRowElementStencilBuilder class >> columnedTreeExample [
	<gtExample>
	
	^ BrColumnedTreeExamples new subclassesOfCollection
		rowStencil: (BrGlamorousColumnedTreeSelectableRowElementStencilBuilder new
			"adds a bit of space to the left from the expander triangle"
			padding: (BlInsets left: 5));
		expandUpTo: 2
]
