Extension { #name : #BrTextEditor }

{ #category : #'*Brick-Editor-Extensions' }
BrTextEditor >> gtInspectorSegmentsIn: aComposite [
	<gtInspectorPresentationOrder: 15>

	^ self segmentCollector gtInspectorSegmentsIn: aComposite
]

{ #category : #'*Brick-Editor-Extensions' }
BrTextEditor >> gtInspectorTextIn: aComposite [
	<gtInspectorPresentationOrder: 15>

	^ self text gtInspectorTextIn: aComposite
]
