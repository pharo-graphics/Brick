instance creation
createPiece: aBrText
	| textElement |

	textElement := self newPiece.
	textElement
		text: aBrText;
		editListener: self editor textEditListener;
		yourself.

	^ textElement