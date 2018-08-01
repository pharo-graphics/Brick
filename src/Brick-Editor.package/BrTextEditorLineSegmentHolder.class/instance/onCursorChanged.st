updating
onCursorChanged
	"Is sent when text editor's cursor changes.
	Segment holder should update text elements accordingly"

	self
		assert: [ segment isNotNil ]
		description: [ 'Segment must be bound!' ].

	pieces
		with: pieceElements
		do: [ :aPiece :aPieceElement | aPiece updateCursor: aPieceElement of: segment in: self infiniteElement ]