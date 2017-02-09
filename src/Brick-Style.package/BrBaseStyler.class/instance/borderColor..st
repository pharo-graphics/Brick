accessing
borderColor: anBlColorValue
	anBlColorValue ifNil: [ ^ self styleable borderColor: Color transparent ].
	anBlColorValue applyOn: self styleable property: #borderColor