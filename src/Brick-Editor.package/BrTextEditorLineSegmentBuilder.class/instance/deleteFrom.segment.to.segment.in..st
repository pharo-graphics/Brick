private - deletion
deleteFrom: aFromIndex segment: aFromSegment to: aToIndex segment: aToSegment in: aBrTextEditor
	"I do the hard work of updating segment structure after deleting a piece of text within provided interval and segments"
	| shouldMergeWithPrevious shouldAccountForPreviousnewLine aTargetSegment removedLength aNewEnd aNewStart |
	
	shouldMergeWithPrevious := self
		shouldMergeDeletingFrom: aFromIndex
		segment: aFromSegment
		in: aBrTextEditor.

	aTargetSegment := shouldMergeWithPrevious
		ifTrue: [ aBrTextEditor segmentCollector segments at: (aFromSegment index - 1) ]
		ifFalse: [ aFromSegment ].

	removedLength := aToIndex - aFromIndex + 1.

	"New end can be zero, in this case we should make new start zero too"
	aNewEnd := aToSegment textEnd - removedLength.
	aNewStart := aTargetSegment textStart min: aNewEnd.
	
	shouldAccountForPreviousnewLine := (aNewStart > 0)
		and: [ (aNewStart < aNewEnd)
			and: [ (aBrTextEditor text at: aNewStart) isLineBreak ] ].

	aTargetSegment
		start: aNewStart + shouldAccountForPreviousnewLine asBit
		end: aNewEnd.
		
	((aTargetSegment ~= aFromSegment) or: [ aFromSegment ~= aToSegment ])
		ifTrue: [
			| removeSegmentStart removeSegmentEnd |
			
			removeSegmentStart := (aTargetSegment ~= aFromSegment)
				ifTrue: [ aFromSegment index ]
				ifFalse: [ (aFromSegment index + 1) min: aToSegment index ].
			removeSegmentEnd := aToSegment index.
			
			aBrTextEditor segmentCollector removeSegmentInterval: (removeSegmentStart to: removeSegmentEnd) ].
	
	aBrTextEditor segmentCollector
		moveTextBy: removedLength negated
		after: aTargetSegment