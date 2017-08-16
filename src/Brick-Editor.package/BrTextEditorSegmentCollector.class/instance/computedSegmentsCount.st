cache - accessing
computedSegmentsCount
	"Return amount of cached segments. If segments are not cached,
	try to cache them and return their amount"
	<return: #Number>
	
	self hasCached
		ifFalse: [ self computeForwardAt: 1 ].
		
	^ self segments size