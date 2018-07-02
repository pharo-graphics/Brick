text - modifications
moveTextBy: aNumber
	super moveTextBy: aNumber.

	"no pieces created (they were not requested yet so no need to move them)"
	self hasPieces
		ifFalse: [ ^ self ].

	self pieces
		do: [ :aTextPiece | aTextPiece start: aTextPiece start + aNumber end: aTextPiece end + aNumber ]