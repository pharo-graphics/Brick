insertion
insert_NewLine_inCrAt_1
	<gtExample>
	| aTextEditor anInsertedListener anInsertedEvent |
	aTextEditor := self insert_NewLine_inEmptyAt_0.

	anInsertedListener := BlEventHandler on: BlInfiniteDataSourceItemRangeInserted do: [ :anEvent | anInsertedEvent := anEvent ].
	aTextEditor addEventHandler: anInsertedListener.

	aTextEditor insertString: String cr at: 1.

	self assert: aTextEditor text asString equals: String cr, String cr.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 1).
	self assert: aTextEditor segmentCollector segments third textInterval equals: (2 to: 2).
	
	self assert: anInsertedEvent itemCount equals: 1.
	self assert: anInsertedEvent position equals: 3.
	
	aTextEditor removeEventHandler: anInsertedListener.

	^ aTextEditor