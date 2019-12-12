Extension { #name : #BrEditorElement }

{ #category : #'*Brick-Editor-Extensions' }
BrEditorElement >> gtSegmentsFor: aView [
	<gtView>

	^ (self editor gtSegmentsFor: aView)
		title: 'Segments';
		priority: 2
]
