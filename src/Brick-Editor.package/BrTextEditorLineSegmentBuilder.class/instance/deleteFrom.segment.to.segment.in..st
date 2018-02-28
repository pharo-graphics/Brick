private - deletion
deleteFrom: aFromIndex segment: aFromSegment to: aToIndex segment: aToSegment in: aBrTextEditor
	| hasPreviousSegment shouldMergeWithPrevious shouldAccountForPreviousnewLine aTargetSegment removedLength aNewEnd aNewStart |
	
	hasPreviousSegment := aFromSegment index > 1.
	
	shouldMergeWithPrevious := (aFromIndex < aFromSegment textStart) or: [
		hasPreviousSegment and: [ 
			| aPreviousSegment |
			aPreviousSegment := aBrTextEditor segmentCollector segments at: (aFromSegment index - 1).
			aPreviousSegment textEnd = (aFromIndex - 1) ] ].
	
	aTargetSegment := shouldMergeWithPrevious
		ifTrue: [ aBrTextEditor segmentCollector segments at: (aFromSegment index - 1) ]
		ifFalse: [ aFromSegment ].

	removedLength := aToIndex - aFromIndex + 1.

	"New end can be zero, in this case we should make new start zero too"
	aNewEnd := aToSegment textEnd - removedLength.
	aNewStart := aTargetSegment textStart min: aNewEnd.
	
	shouldAccountForPreviousnewLine := aNewStart > 0 and: [ (aBrTextEditor text at: aNewStart) isLineBreak ].
	
	aTargetSegment
		start: aNewStart + shouldAccountForPreviousnewLine asBit
		end: aNewEnd.
		
	(aTargetSegment ~= aFromSegment)
		ifTrue: [ aBrTextEditor segmentCollector removeSegmentInterval: (aFromSegment index to: aToSegment index) ].
	
	aBrTextEditor segmentCollector
		moveTextBy: removedLength negated
		after: aTargetSegment