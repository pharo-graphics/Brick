accessing
segment: anEditorSegment
	segment := anEditorSegment.

	('rebuilding {1}' format: { segment index }) logCr.

	pieces := segment pieces
		collect: [ :aText | self createPiece: aText ].

	itemElement removeChildren.
	itemElement addChildren: pieces.

	self dataSourcePosition odd
		ifTrue: [ itemElement background: Color veryVeryLightGray lighter ]
		ifFalse: [ itemElement background: Color transparent ]