Extension { #name : #BrEditorSegmentStream }

{ #category : #'*Brick-Editor-Extensions' }
BrEditorSegmentStream >> gtInspectorSegmentsIn: composite [
	<gtInspectorPresentationOrder: 0>

	^ composite fastTable
		title: 'Segments' translated;
		display: [ self collection ];
		column: 'Index' 
			evaluated: [ :each | '({1}-{2})' format: { each textStart . each textEnd } ];
		column: 'Text' 
			evaluated: [ :each | GTObjectPrinter asTruncatedTextFrom: each ]
]
