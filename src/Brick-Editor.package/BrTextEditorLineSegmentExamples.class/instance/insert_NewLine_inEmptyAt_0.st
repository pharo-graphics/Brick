examples - insertion
insert_NewLine_inEmptyAt_0
	<gtExample>
	| aTextEditor |
	aTextEditor := self emptyEditor.
	
	aTextEditor insertString: String cr at: 0.

	self assert: aTextEditor text asString equals: String cr.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 1).

	^ aTextEditor