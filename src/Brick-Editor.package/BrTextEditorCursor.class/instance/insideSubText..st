testing
insideSubText: aBrSubText
	"Return true if I am inside a given subtext, false otherwise"
	<return: #Boolean>

	aBrSubText isEmpty
		ifTrue: [ ^ self position isZero ].

	self position isZero
		ifTrue: [ ^ aBrSubText start = 1 ].

	^ self position
		between: aBrSubText start
		and: aBrSubText end