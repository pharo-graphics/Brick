as yet unclassified
fontSize: anBlValue
	anBlValue ifNil: [ ^ self styleable fontFamily: StandardFonts defaultFont pointSize ].
	self styleable fontSize: anBlValue value