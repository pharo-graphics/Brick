Extension { #name : #BrTextEditor }

{ #category : #'*Brick-Extensions' }
BrTextEditor >> gtStringFor: aView [
	<gtView>
	^ (self text 
		gtStringFor: aView)
		priority: 5
]
