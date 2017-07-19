cache - computation
computeForwardAt: anIndex
	| intervalEnd cachedInterval currentIndex actualStart iterator |

	"the index of the last already cached segment"
	intervalEnd := interval last.

	"indices interval of segments that we expect to cache in the end"
	cachedInterval := self computeInterval: anIndex.

	"new cached interval may overlap with existing cache, take it into account
	by computing an actual cache start index of a segment"
	actualStart := cachedInterval first max: (intervalEnd + 1).

	"when accessing by random index, there might be a gap between old and new cached intervals,
	so we need to interate over all segments until we reach actualStart"
	currentIndex := intervalEnd.
	
	"a collection in which we will cache segments"
	segments := self forwardSegments: cachedInterval.

	iterator := self forwardIterator.
	[ iterator hasNext and: [ currentIndex < cachedInterval last ] ] whileTrue: [
	   | lineText textSegment |
		lineText := iterator nextLine.
		currentIndex := currentIndex + 1.

		(currentIndex >= actualStart)
			ifTrue: [
				textSegment := self newSegment.
				textSegment index: currentIndex.
				textSegment segment: lineText.
				segments add: textSegment ] ].
		
	interval := cachedInterval first to: currentIndex.
	self updateSubText