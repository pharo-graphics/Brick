insertion
insert_NewLine_inCrAt_1_: aTextEditor
	<gtExample>
	<dependsOn: #insert_NewLine_inEmptyAt_0_:>

	aTextEditor insertString: String cr at: 1.

	self assert: aTextEditor text asString equals: String cr, String cr.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 1).
	self assert: aTextEditor segmentCollector segments third textInterval equals: (2 to: 2).

	^ aTextEditor