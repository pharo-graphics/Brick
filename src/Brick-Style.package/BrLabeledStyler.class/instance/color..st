as yet unclassified
color: anBlValue
	anBlValue ifNil: [ ^ self styleable fontColor: Color black ].
	self styleable fontColor: anBlValue value