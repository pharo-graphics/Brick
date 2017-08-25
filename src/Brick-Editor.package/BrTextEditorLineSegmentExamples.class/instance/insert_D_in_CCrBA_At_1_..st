insertion
insert_D_in_CCrBA_At_1_: aTextEditor
	<gtExample>
	<dependsOn: #insert_C_in_CrBA_At_0_:>

	aTextEditor insertString: 'D' at: 1.

	self assert: aTextEditor text asString equals: 'CD', String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (1 to: 2).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (4 to: 5).

	^ aTextEditor