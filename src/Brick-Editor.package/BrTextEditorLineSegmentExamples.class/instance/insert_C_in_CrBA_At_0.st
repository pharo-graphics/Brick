examples - insertion
insert_C_in_CrBA_At_0
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_BA_At_0.

	aTextEditor insertString: 'C' at: 0.

	self assert: aTextEditor text asString equals: 'C', String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 1).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'C'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (2 to: 4).
	self assert: aTextEditor segmentCollector segments second text asString equals: 'BA'.

	^ aTextEditor