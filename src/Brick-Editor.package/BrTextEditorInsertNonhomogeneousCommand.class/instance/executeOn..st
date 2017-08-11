executing
executeOn: aTextEditor
	| aString |
	
	aString := self character asString.

	aTextEditor text
		insertString: aString
		at: self index.

	aTextEditor segmentCollector
		cachedSegmentAt: self index
		ifFound: [ :aSegment |			
			aSegment start: (aSegment textStart max: 1) end: aSegment textEnd + 1.
			aSegment invalidate.

			"move all segments after the one in which text was inserted"
			aTextEditor segmentCollector moveTextBy: 1 after: aSegment.
	
			aTextEditor notifyItemsChanged: (aSegment index to: aSegment index) ]
		ifNotFound: [ :aCollector |
			(self index < aCollector start)
				ifTrue: [ aCollector moveTextBy: 1 ]
		]