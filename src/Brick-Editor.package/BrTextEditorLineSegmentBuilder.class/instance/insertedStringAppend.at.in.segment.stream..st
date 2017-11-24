text - modifications
insertedStringAppend: aString at: aTextIndex in: aBrTextEditor segment: aCurrentSegment stream: aStream
	| isAfterLineBreak |
	
	"true if string is inserted after line break character"
	isAfterLineBreak := aTextIndex isZero
		ifTrue: [ false ]
		ifFalse: [ aCurrentSegment isLineBreak ].

	aCurrentSegment invalidate.
	
	aCurrentSegment
		start: (aCurrentSegment textStart + isAfterLineBreak asBit max: 1)
		end: aCurrentSegment textEnd + aString size.

	aBrTextEditor segmentCollector
		moveTextBy: aString size
		after: aCurrentSegment