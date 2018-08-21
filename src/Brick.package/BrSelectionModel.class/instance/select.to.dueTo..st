api - selection
select: aFromIndex to: aToIndex dueTo: aSourceEvent
	"Select items within a given interval"

	selection select: aFromIndex to: aToIndex.
	self notifySelected: (aFromIndex to: aToIndex) dueTo: aSourceEvent