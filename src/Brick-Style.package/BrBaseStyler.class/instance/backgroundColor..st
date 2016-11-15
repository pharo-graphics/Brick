as yet unclassified
backgroundColor: anBlColorValue
	anBlColorValue ifNil: [ ^ self styleable backgroundColor: Color transparent ].
	"self styleable backgroundColor: anBlColorValue value."
	anBlColorValue applyOn: self styleable property:#backgroundColor.