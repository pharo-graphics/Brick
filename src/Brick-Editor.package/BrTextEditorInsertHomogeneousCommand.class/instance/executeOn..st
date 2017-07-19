executing
executeOn: aTextEditor

	aTextEditor collector
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

			aTextEditor collector
				moveTextBy: 1
				after: aSegment ]
		ifNotFound: [ self shouldBeImplemented ]