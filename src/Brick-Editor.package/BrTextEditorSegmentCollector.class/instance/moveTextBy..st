text - modifications
moveTextBy: aNumber
	"move all segments by aNumber"
	
	self hasCached
		ifFalse: [ ^ self ].
	
	self segments do: [ :aSegment | aSegment moveTextBy: aNumber ].
	self computeSubText