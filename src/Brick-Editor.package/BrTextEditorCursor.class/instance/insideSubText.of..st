testing
insideSubText: aBrSubText of: aSegment
	"Return true if I am inside a given subtext, false otherwise"
	<return: #Boolean>

	aBrSubText isEmpty
		ifTrue: [ ^ self position isZero ].

	self position isZero
		ifTrue: [ ^ aBrSubText start = 1 ].

	(aBrSubText = aSegment pieces first)
		ifTrue: [ 
			^ self position
				between: aBrSubText start - 1
				and: aBrSubText end ].

	^ self position
		between: aBrSubText start
		and: aBrSubText end