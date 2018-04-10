initialization
defaultCellElement: aCellValue
	<return: #BlElement>

	^ BlTextElement new
		text: (aCellValue asString asRopedText);
		constraintsDo: [ :c | c horizontal matchParent ];
		padding: (BlInsets all: 6)