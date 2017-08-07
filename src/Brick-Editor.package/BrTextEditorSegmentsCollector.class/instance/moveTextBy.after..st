text - modifications
moveTextBy: aNumber after: aSegment
	"move all segments after the given segment by aNumber"

	aSegment index + 1 to: self segmentsCount do: [ :anIndex |
		| eachSegment |
		eachSegment := self cachedAt: anIndex.
		eachSegment moveTextBy: aNumber ].
	
	self computeSubText