insertion
insert_NewLine_in_CDCrBA_At_0
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_D_in_CCrBA_At_1.

	aTextEditor insertString: String cr at: 0.

	self assert: aTextEditor text asString equals: String cr, 'CD', String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (2 to: 3).
	self assert: aTextEditor segmentCollector segments third textInterval equals: (5 to: 6).

	^ aTextEditor