text - modifications
moveTextBy: aNumber
	"Move all sub-text pieces (#start and #end) known by the segment by a given amount of indicies.
	If aNumber is negative sub-texts will be moved to the left (maybe this is a result of a deletion).
	If aNumber is positive sub-texts will be moved to the right (maybe this is a result of an insertion).
	aNumber must not be zero - undefined behaviour (nothing was inserted but the message is sent? Probably a bug)"
	| aText |

	aText := self text.
	aText start: aText start + aNumber.
	aText end: aText end + aNumber.
	
	"no pieces created (they were not requested yet so no need to move them)"
	self hasPieces
		ifFalse: [ ^ self ].
		
	self pieces do: [ :aTextPiece |
		aTextPiece start: aTextPiece start + aNumber.
		aTextPiece end: aTextPiece end + aNumber ]