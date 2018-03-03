private - deletion
shouldMergeDeletingFrom: aFromIndex segment: aFromSegment in: aBrTextEditor
	"Return true if we should merge a given segment with the previous if we delete a piece of
	text in a given editor starting from a provided index, false otherwise"
	<return: #Boolean>
	| aPreviousSegment |

	"A given segment is already the first one, there is no previous to merge with"
	aFromSegment index = 1
		ifTrue: [ ^ false ].

	"when from index is less then segment start index it means we delete a line break symbol and therefore must merge"	
	(aFromIndex < aFromSegment textStart)
		ifTrue: [ ^ true ].

	aPreviousSegment := aBrTextEditor segmentCollector segments at: (aFromSegment index - 1).
	
	"if the difference between the end of the previous segment and the start of
	our deletion interval is 1 it means that we are trying to delete a line break symbol
	which is preceded by another line break"
	^ (aFromIndex - aPreviousSegment textEnd) = 1