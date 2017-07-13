instance creation
pieceElementFor: aBrText
	^ BlTextEditElement new
		clipChildren: false;
		text: aBrText;
		yourself