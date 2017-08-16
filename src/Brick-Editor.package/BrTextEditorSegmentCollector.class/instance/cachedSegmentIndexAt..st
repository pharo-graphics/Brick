cache - accessing
cachedSegmentIndexAt: aTextIndex
	"Return an index of a segment in a collection of cached segments that contains
	a text item with a given index or return 0 if no such *cached* segment exists.
	I use binary search to find a segment, algorithmic complexity O(log n)"
	<return: #Number>
	
	^ self segments
		findBinaryIndex: [ :aSegment |
			(aTextIndex between: aSegment textStart and: aSegment textEnd)
				ifTrue: [ 0 ]
				ifFalse: [
					aTextIndex < aSegment textStart
						ifTrue: [ -1 ]
						ifFalse: [ 1 ] ] ]
		ifNone: [ :leftIndex :rightIndex |
			(leftIndex isNil and: [ rightIndex isNil ])
				ifTrue: [ 0 ]
				ifFalse: [
					| anIndex |
					anIndex := 0.
					leftIndex > 0 ifTrue: [
						(aTextIndex + 1 = (self segments at: leftIndex) textStart)
							ifTrue: [ anIndex := leftIndex ] ].
					rightIndex <= self segments size ifTrue: [
						(aTextIndex + 1 = (self segments at: rightIndex) textStart)
							ifTrue: [ anIndex := rightIndex ] ].
					anIndex ] ]