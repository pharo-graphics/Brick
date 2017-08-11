instance creation
createPiece: aBrText

	^ self newPiece
		text: aBrText;
		editListener: self editor textEditListener;
		yourself