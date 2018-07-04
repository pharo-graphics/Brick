examples - insertion
insert_A_inEmptyAt_0
	<gtExample>
	| aTextEditor |
	
	aTextEditor := self emptyEditor.
	
	aTextEditor insertString: 'A' at: 0.
	
	self assert: aTextEditor text asString equals: 'A'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 1).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'A'.

	^ aTextEditor