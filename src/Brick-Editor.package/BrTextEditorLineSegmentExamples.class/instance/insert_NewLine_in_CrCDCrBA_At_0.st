insertion
insert_NewLine_in_CrCDCrBA_At_0
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_CDCrBA_At_0.

	aTextEditor insertString: String cr at: 0.

	self assert: aTextEditor text asString equals: String cr, String cr, 'CD', String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 4.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 1).
	self assert: aTextEditor segmentCollector segments third textInterval equals: (3 to: 4).
	self assert: aTextEditor segmentCollector segments fourth textInterval equals: (6 to: 7).

	^ aTextEditor