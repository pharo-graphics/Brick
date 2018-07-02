text - modifications
deletedFrom: aFromIndex to: aToIndex in: aBrTextEditor
	| aFromSegment aToSegment aTargetSegment |

	self
		assert: [ aFromIndex <= aToIndex ]
		description: [ '`From` index must be less or equal to `to` index' ].

	aBrTextEditor segmentCollector
		cachedSegmentAt: aFromIndex
		ifFound: [ :aSegment | aFromSegment := aSegment ]
		ifNotFound: [ ].

	aBrTextEditor segmentCollector
		cachedSegmentAt: aToIndex
		ifFound: [ :aSegment | aToSegment := aSegment ]
		ifNotFound: [ ].

	"we delete something completely outside of the cached segments, just ignore it"
	(aFromSegment isNil or: [ aToSegment isNil ])	
		ifTrue: [ self error: 'Not implemented yet' ].

	aTargetSegment := self deleteFrom: aFromIndex segment: aFromSegment to: aToIndex segment: aToSegment in: aBrTextEditor.

	aBrTextEditor invalidate: aTargetSegment textStart to: aTargetSegment textEnd.
	aBrTextEditor update: aTargetSegment textStart to: aTargetSegment textEnd