accessing
segment: anEditorSegment
	| pieceElements |

	segment := anEditorSegment.

	pieceElements := segment pieces
		collect: [ :aText | self createPiece: aText ].

	itemElement removeChildren.
	itemElement addChildren: pieceElements.
	
	self dataSourcePosition odd
		ifTrue: [ itemElement background: Color veryVeryLightGray lighter ]
		ifFalse: [ itemElement background: Color transparent ]