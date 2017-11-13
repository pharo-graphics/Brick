updating
onSelectionChanged
	"Is sent when text editor's selection changes.
	Segment holder should update text elements accordingly"
		
	self
		assert: [ segment isNotNil ]
		description: [ 'Segment must be bound!' ].

	pieces
		with: pieceElements
		do: [ :aPiece :aPieceElement | aPiece updateSelection: aPieceElement of: segment in: self infiniteElement ]