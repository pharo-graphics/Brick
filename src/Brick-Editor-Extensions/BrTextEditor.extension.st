Extension { #name : #BrTextEditor }

{ #category : #'*Brick-Editor-Extensions' }
BrTextEditor >> gtHistoryFor: aView [
	<gtView>

	^ (self history gtHistoryFor: aView)
		title: 'History';
		priority: 2
]

{ #category : #'*Brick-Editor-Extensions' }
BrTextEditor >> gtLiveFor: aView [
	<gtView>

	^ aView explicit
		title: 'Live';
		priority: 0;
		stencil: [ 
			BrEditorElement new 
				editor: self;
				padding: (BlInsets all: 10);
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ];
				requestFocus ]
]

{ #category : #'*Brick-Editor-Extensions' }
BrTextEditor >> gtSegmentsFor: aView [
	<gtView>

	^ (self segmentCollector gtSegmentsFor: aView)
		title: 'Segments';
		priority: 3
]

{ #category : #'*Brick-Editor-Extensions' }
BrTextEditor >> gtSelectionTreeFor: aView [
	<gtView>

	^ (selection gtTreeFor: aView)
		priority: 5;
		title: 'Selection'
]

{ #category : #'*Brick-Editor-Extensions' }
BrTextEditor >> gtTextFor: aView [
	<gtView>
	^ (self text 
		gtTextFor: aView)
		priority: 1
]
