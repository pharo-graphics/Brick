accessing
segment: anEditorSegment
	| anEditor pieceElements |

	segment := anEditorSegment.
	anEditor := self infiniteElement dataSource.
	
	pieceElements := segment pieces
		collect: [ :aText | self pieceElementFor: aText ].
	
	itemElement layout: BrEditorFlowLayout new.
	itemElement removeChildren.
	itemElement addChildren: pieceElements