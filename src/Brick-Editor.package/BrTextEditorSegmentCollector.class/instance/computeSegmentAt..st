accessing
computeSegmentAt: anIndex
	<return: #BrEditorSegment>

	self
		assert: [ (self isCachedAt: anIndex) not ]
		description: [ 'Computing of already cached segment is wasteful' ].

	anIndex > self end
		ifTrue: [ self computeForwardAt: anIndex ]
		ifFalse: [ self computeBackwardAt: anIndex ].

	self
		assert: [ self isCachedAt: anIndex ]
		description: [ 'Segment must be already cached!' ].

	^ self cachedAt: anIndex