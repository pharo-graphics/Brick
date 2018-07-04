examples - insertion
insert_NewLineCrLf_in_HACrBA_At_3
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HABA_At_2.

	aTextEditor insertString: String cr, String lf at: 3.

	self assert: aTextEditor text asString equals: 'HA', String cr, String cr, String lf, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'HA'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 3).
	self assert: aTextEditor segmentCollector segments second text asString equals: String cr.
	self assert: aTextEditor segmentCollector segments third textInterval equals: (5 to: 7).
	self assert: aTextEditor segmentCollector segments third text asString equals: 'BA'.

	^ aTextEditor