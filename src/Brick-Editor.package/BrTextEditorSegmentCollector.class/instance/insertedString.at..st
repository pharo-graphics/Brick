text - modifications
insertedString: aString at: aTextIndex
	"Sent after a given string was inserted in the text a provided index.
	We should move all cached segments by (aString size) text indices to the right"
	| segmentIndex segment |

	segmentIndex := self cachedSegmentIndexAt: aTextIndex.
	
	"if segment index is zero it means that text was modified outsize of currently cached elements"
	segmentIndex isZero
		"we should handle the case when text was inserted at index before a #start
		of the first segment. when it happens we need to move all cached segments"
		ifTrue: [ self shouldBeImplemented ].

	self
		"Make sure that returned value makes sense and cache is not broken"
		assert: [ self isCachedAt: segmentIndex ]
		description: [ 'Segment must be cached' ].

	segment := self cachedAt: segmentIndex.
	segment insertedString: aString at: aTextIndex.

	"move all segments after the one in which text was inserted"
	segmentIndex + 1 to: self computedSegmentsCount do: [ :anIndex |
		| eachSegment |
		eachSegment := self cachedAt: anIndex.
		eachSegment moveTextBy: aString size ]