executing
executeOn: aTextEditor

	aTextEditor segmentsCollector
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

			aTextEditor segmentsCollector
				moveTextBy: 1
				after: aSegment ]
		ifNotFound: [ self shouldBeImplemented ]