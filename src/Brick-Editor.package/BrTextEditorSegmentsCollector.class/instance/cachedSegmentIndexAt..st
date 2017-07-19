cache - accessing
cachedSegmentIndexAt: aTextIndex
	"Return an index of a segment in a collection of cached segments that contains
	a text item with a given index or return 0 if no such *cached* segment exists.
	I use binary search to find a segment, algorithmic complexity O(log n)"
	<return: #Number>
	
	^ self segments
		findBinaryIndex: [ :aSegment |
			(aTextIndex between: aSegment start - 1 and: aSegment end)
				ifTrue: [ 0 ]
				ifFalse: [ (aTextIndex < (aSegment start - 1))
					ifTrue: [ -1 ]
					ifFalse: [ 1 ] ] ]
		ifNone: [ 0 ]