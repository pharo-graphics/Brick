text - modifications
insertedStringAdd: aString at: aTextIndex in: aBrTextEditor after: aCurrentSegment stream: aStream
		
	aStream segments last
		start: (aStream segments last textStart min: aCurrentSegment textEnd) + aString size
		end: aCurrentSegment textEnd + aString size.

	aCurrentSegment
		start: aCurrentSegment textStart
		end: aStream segments first textEnd.
	
	aBrTextEditor segmentCollector
		addSegments: (aStream segments last: aStream segments size - 1)
		after: aCurrentSegment.
	
	aBrTextEditor segmentCollector
		moveTextBy: aString size
		after: aStream segments last