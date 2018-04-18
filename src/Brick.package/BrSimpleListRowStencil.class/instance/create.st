api - instantiation
create
	^ BlTextElement new
		margin: (BlInsets all: 3);
		text: (self rowValue asString asRopedText);
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ]