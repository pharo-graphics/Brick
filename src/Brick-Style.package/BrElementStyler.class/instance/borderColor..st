accessing
borderColor: aBlColorValue
	self styleable border: (self styleable border copyWithPaint: (aBlColorValue value ifNil: [ Color transparent ]))