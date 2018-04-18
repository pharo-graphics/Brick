api - instantiation
create
	^ BlTextElement new
		margin: (BlInsets all: 3);
		text: (self rowIndex asString asRopedText foreground: Color gray);
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ]