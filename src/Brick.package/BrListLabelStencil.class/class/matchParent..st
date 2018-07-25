instance creation
matchParent: aText
	^ BlTextElement new
		margin: (BlInsets all: 3);
		text: aText asRopedText;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ]