executing
executeOn: aTextEditor
	| aString |
	
	aString := self character asString.

	aTextEditor text
		insertString: aString
		at: self index.

	aTextEditor collector
		cachedSegmentAt: self index
		ifFound: [ :aSegment |
			aSegment end: aSegment end + 1.
			aSegment invalidate.

			"move all segments after the one in which text was inserted"
			aTextEditor collector moveTextBy: 1 after: aSegment.
	
			aTextEditor notifyItemsChanged: (aSegment index to: aSegment index) ]
		ifNotFound: [ :aCollector |
			(self index < aCollector start)
				ifTrue: [ aCollector moveTextBy: 1 ]
		]