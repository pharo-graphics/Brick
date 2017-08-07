executing
executeOn: aTextEditor
	| aString |
	
	aString := self character asString.

	aTextEditor text
		insertString: aString
		at: self index.

	aTextEditor segmentsCollector
		cachedSegmentAt: self index
		ifFound: [ :aSegment |			
			aSegment start: (aSegment start max: 1) end: aSegment end + 1.
			aSegment invalidate.

			"move all segments after the one in which text was inserted"
			aTextEditor segmentsCollector moveTextBy: 1 after: aSegment.
	
			aTextEditor notifyItemsChanged: (aSegment index to: aSegment index) ]
		ifNotFound: [ :aCollector |
			(self index < aCollector start)
				ifTrue: [ aCollector moveTextBy: 1 ]
		]