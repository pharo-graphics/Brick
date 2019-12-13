Extension { #name : #BrEditorElement }

{ #category : #'*Brick-Editor-Extensions' }
BrEditorElement >> gtHistoryFor: aView [
	<gtView>

	^ (self editor gtHistoryFor: aView)
		title: 'History';
		priority: 1
]

{ #category : #'*Brick-Editor-Extensions' }
BrEditorElement >> gtSegmentsFor: aView [
	<gtView>

	^ (self editor gtSegmentsFor: aView)
		title: 'Segments';
		priority: 2
]
