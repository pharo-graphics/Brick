insertion
insert_Hello_inEmptyAt_0_: aTextEditor
	<gtExample>
	<dependsOn: #editor:segmentBuilder:>

	aTextEditor insertString: 'Hello' at: 0.

	self assert: aTextEditor text asString equals: 'Hello'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (1 to: 5).

	^ aTextEditor