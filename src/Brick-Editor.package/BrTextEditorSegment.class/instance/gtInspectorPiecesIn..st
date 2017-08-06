as yet unclassified
gtInspectorPiecesIn: composite
	<gtInspectorPresentationOrder: 0>

	^ composite fastList
		title: 'Pieces' translated;
		display: [ self pieces ];
		format: [ :each | GTObjectPrinter asTruncatedTextFrom: each ]