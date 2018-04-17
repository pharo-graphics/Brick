api - instantiation
createDefault
	^ BlTextElement new
		margin: (BlInsets all: 3);
		text: self rowValue name asString asRopedText;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ]