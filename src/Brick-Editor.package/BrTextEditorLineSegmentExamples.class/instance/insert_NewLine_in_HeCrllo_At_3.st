insertion
insert_NewLine_in_HeCrllo_At_3
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_Hello_At_2.

	aTextEditor insertString: String cr at: 3.

	self assert: aTextEditor text asString equals: 'He', String cr, String cr, 'llo'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (1 to: 2).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 3).
	self assert: aTextEditor segmentCollector segments third textInterval equals: (5 to: 7).

	^ aTextEditor