cache - accessing
cachedSegmentAt: aTextIndex ifFound: aFoundBlock ifNotFound: aNotFoundBlock
	| segmentIndex segment |

	segmentIndex := self cachedSegmentIndexAt: aTextIndex.
	
	"if segment index is zero it means that text was modified outsize of currently cached elements"
	segmentIndex isZero
		"we should handle the case when text was inserted at index before a #start
		of the first segment. when it happens we need to move all cached segments"
		ifTrue: [ ^ aNotFoundBlock value ].

	self
		"Make sure that returned value makes sense and cache is not broken"
		assert: [ self isCachedAt: segmentIndex ]
		description: [ 'Segment must be cached' ].
		
	segment := self cachedAt: segmentIndex.
	
	self
		assert: [ segment index = segmentIndex ]
		description: [ 'Segment must have a valid index' ].
		
	aFoundBlock cull: segment