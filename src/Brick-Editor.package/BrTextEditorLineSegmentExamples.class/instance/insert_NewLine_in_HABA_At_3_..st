insertion
insert_NewLine_in_HABA_At_3_: aTextEditor
	<gtExample>
	<dependsOn: #insert_HABA_inEmptyAt_0_:>

	aTextEditor insertString: String cr at: 3.

	self assert: aTextEditor text asString equals: 'HAB', String cr, 'A'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (1 to: 3).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (5 to: 5).

	^ aTextEditor