api - selection
deselect: aFromIndex to: aToIndex
	"Deselect items within a given interval"

	selection deselect: aFromIndex to: aToIndex.
	self notifyDeselected: (aFromIndex to: aToIndex)