insertion
insert_NewLine_inEmptyAt_0_: aTextEditor
	<gtExample>
	<dependsOn: #editor:segmentBuilder:>

	aTextEditor insertString: String cr at: 0.

	self assert: aTextEditor text asString equals: String cr.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 1).

	^ aTextEditor