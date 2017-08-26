text - modifications
insertedStringAdd: aString at: aTextIndex in: aBrTextEditor segment: aCurrentSegment stream: aStream
	| newLastSegmentStart isLastLineBreak isBeforeLineBreak newCurrentSegmentStart newCurrentSegmentEnd newLastSegmentEnd isFirstLineBreak |

	"true if inserted string starts with a line break"
	isFirstLineBreak := aString first isLineBreak.

	"true if inserted string ends with a line break"
	isLastLineBreak := aString last isLineBreak.

	"true if string is inserted before line break character"
	isBeforeLineBreak := (aTextIndex + 1 < aBrTextEditor text size
		and: [ aBrTextEditor text size > 1 ])
		ifTrue: [ (aBrTextEditor text at: aTextIndex + 2) isLineBreak ]
		ifFalse: [ false ].

	newCurrentSegmentStart := aCurrentSegment textStart.
	newCurrentSegmentEnd := aStream collection first textEnd.

	aStream segments
		select: [ :aSegment | aSegment text allSatisfy: #isLineBreak ]
		thenDo: [ :aSegment | aSegment
			start: aSegment textStart - 1
				end: aSegment textEnd - 1 ].

	(aTextIndex isZero and: [ isFirstLineBreak ])
		ifTrue: [
			newCurrentSegmentStart := 0.
			newCurrentSegmentEnd := 0 ].

	newLastSegmentStart := aStream collection last textStart + (aTextIndex isZero not and: [ isFirstLineBreak ]) asBit.

	"we move segments by `aString size` after last streamed segment later"
	newLastSegmentEnd := aCurrentSegment textEnd + aString size.

	"it makes sense to invalidate current segment only if it is splitted in half"
	newCurrentSegmentEnd ~= aCurrentSegment textEnd
		ifTrue: [ aCurrentSegment
				start: newCurrentSegmentStart
				end: newCurrentSegmentEnd.
			aCurrentSegment invalidate ].
		
	aStream collection last
		start: newLastSegmentStart
		end: newLastSegmentEnd.
	
	aBrTextEditor segmentCollector
		addSegments: (aStream collection last: aStream collection size - 1)
		after: aCurrentSegment.
	
	aBrTextEditor segmentCollector
		moveTextBy: aString size
		after: aStream collection last