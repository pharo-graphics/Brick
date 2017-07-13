cache - computation
forwardSegments: aNewCachedInterval
	"Create and return a collection which will be used to collect segments for a given new cached interval.
	If existing cached interval overlaps with the new one, we should copy already cached segments to reduce amount of work"
	<return: #OrderedCollection>
	
	^ (self isCachedAt: aNewCachedInterval first)
		ifTrue: [ segments copyFrom: aNewCachedInterval first to: self lastIndex ]
		ifFalse: [ self newSegments ]