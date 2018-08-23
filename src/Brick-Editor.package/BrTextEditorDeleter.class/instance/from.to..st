api - configuration
from: aFromIndex to: aToIndex
	"Mark a text interval given by from an to indices as the one to be deleted"

	aFromIndex = aToIndex
		ifTrue: [ ^ self ].

	deletionIntervals select: aFromIndex to: aToIndex