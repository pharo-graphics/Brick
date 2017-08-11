executing
executeOn: aTextEditor

	aTextEditor segmentCollector
		cachedSegmentAt: self index
		ifFound: [ :aSegment |
			| aString |
	
			aString := self character asString.

			aTextEditor text
				insertString: aString
				at: self index.
		
			aSegment
				insertedString: aString
				at: self index.

			aTextEditor segmentCollector
				moveTextBy: 1
				after: aSegment ]
		ifNotFound: [ self shouldBeImplemented ]