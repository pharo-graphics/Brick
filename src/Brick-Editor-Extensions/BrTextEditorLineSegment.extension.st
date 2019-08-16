Extension { #name : #BrTextEditorLineSegment }

{ #category : #'*Brick-Editor-Extensions' }
BrTextEditorLineSegment >> gtInspectorPiecesIn: composite [
	<gtInspectorPresentationOrder: 0>

	^ composite fastTable
		title: 'Pieces' translated;
		display: [ self pieces ];
		column: 'Interval'
			evaluated: [ :each | (each textStart to: each textEnd) asString ];
		column: 'Text'
			evaluated: [ :each | GTObjectPrinter asTruncatedTextFrom: each ]
]
