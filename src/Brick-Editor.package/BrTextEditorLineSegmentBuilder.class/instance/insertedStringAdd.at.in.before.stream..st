text - modifications
insertedStringAdd: aString at: aTextIndex in: aBrTextEditor before: aCurrentSegment stream: aStream
	
	aBrTextEditor segmentCollector
		addSegments: (aStream segments first: aStream segments size - 1)
		before: aCurrentSegment.
	
	aBrTextEditor segmentCollector
		moveTextBy: aString size
		after: (aStream segments at: aStream segments size - 1)