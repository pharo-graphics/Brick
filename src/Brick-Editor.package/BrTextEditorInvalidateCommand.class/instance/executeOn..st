executing
executeOn: aTextEditor
	| changedFrom changedTo |
	
	changedFrom := self fromIndex. "now it is text index"
	changedTo := self toIndex. "now it is text index"

	"convert from text => to segment index => segment array index"
	aTextEditor segmentCollector
		cachedSegmentAt: changedFrom
		ifFound: [ :aSegment | changedFrom := (aSegment index - aTextEditor segmentCollector firstIndex) + 1 ]
		ifNotFound: [ 1 ].

	"convert from text => to segment index => segment array index"
	aTextEditor segmentCollector
		cachedSegmentAt: changedTo
		ifFound: [ :aSegment | changedTo := (aSegment index - aTextEditor segmentCollector firstIndex) +1 ]
		ifNotFound: [ changedTo := aTextEditor segmentCollector segments size ].	

	changedFrom to: changedTo do: [ :anIndex |
		(aTextEditor segmentCollector segments at: anIndex) invalidate ]