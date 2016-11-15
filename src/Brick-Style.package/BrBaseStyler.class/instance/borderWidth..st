as yet unclassified
borderWidth: anBlValue
	anBlValue ifNil: [ ^ self styleable borderWidth: 0 ].
	self styleable borderWidth: anBlValue value