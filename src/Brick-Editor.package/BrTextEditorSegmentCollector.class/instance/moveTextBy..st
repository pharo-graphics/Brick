text - modifications
moveTextBy: aNumber
	"move all segments' subTexts start/end indices by aNumber"

	self hasCached
		ifFalse: [ ^ self ].
	
	self segments do: [ :aSegment | aSegment moveTextBy: aNumber ].
	self computeSubText