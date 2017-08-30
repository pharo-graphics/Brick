insertion
insert_HABA_inEmptyAt_0_: aTextEditor
	<gtExample>
	<dependsOn: #editor:segmentBuilder:>
	
	aTextEditor insertString: 'HABA' at: 0.
	
	self assert: aTextEditor text asString equals: 'HABA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (1 to: 4).

	^ aTextEditor