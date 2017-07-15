instance creation
createPiece: aBrText
	| textElement |

	textElement := self newPiece.
	textElement
		text: aBrText;
		yourself.

	self initializePiece: textElement.

	^ textElement