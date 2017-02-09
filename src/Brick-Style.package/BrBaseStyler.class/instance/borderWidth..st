accessing
borderWidth: anBlValue
	anBlValue ifNil: [ ^ self styleable borderWidth: 0 ].
	self styleable borderWidth: anBlValue value