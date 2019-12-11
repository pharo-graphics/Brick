Extension { #name : #BrTextEditorSegmentCollector }

{ #category : #'*Brick-Editor-Extensions' }
BrTextEditorSegmentCollector >> gtInspectorSegmentsIn: composite [
	<gtInspectorPresentationOrder: 0>

	^ composite fastTable
		title: 'Segments' translated;
		display: [ self segments ];
		column: 'Index' 
			evaluated: [ :each | '{1} ({2}-{3})' format: { each index . each textStart . each textEnd } ];
		column: 'Text' 
			evaluated: [ :each | GTObjectPrinter asTruncatedTextFrom: each ]
]

{ #category : #'*Brick-Editor-Extensions' }
BrTextEditorSegmentCollector >> gtSegmentsFor: aView [
	<gtView>

	^ aView columnedList
		title: 'Segments';
		items: [ self segments ];
		priority: 1;
		column: 'Index' item: [ :each | '{1} ({2}-{3})' format: { each index . each textStart . each textEnd } ];
		column: 'Text' item: [ :each | each ]
]
