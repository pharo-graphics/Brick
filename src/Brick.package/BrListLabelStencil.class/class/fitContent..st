instance creation
fitContent: aText
	^ BlTextElement new
		margin: (BlInsets all: 3);
		text: aText asRopedText;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent ]