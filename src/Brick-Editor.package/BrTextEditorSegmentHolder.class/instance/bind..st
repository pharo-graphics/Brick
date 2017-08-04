binding
bind: aTextEditorSegment
	pieces := segment pieces.
	pieceElements := segment hasPieceElements
		ifTrue: [ segment pieceElements ]
		ifFalse: [ pieces collect: [ :aText | self createPiece: aText ] ].
	segment pieceElements: pieceElements.
	
	pieceElements do: [ :each | each removeFromParent ].
	itemElement removeChildren.
	itemElement addChildren: pieceElements