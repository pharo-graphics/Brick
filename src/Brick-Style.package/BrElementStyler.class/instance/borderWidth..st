accessing
borderWidth: anBlValue
	self styleable border: (self styleable border copyWithWidth: (anBlValue value ifNil: [ 0 ]))