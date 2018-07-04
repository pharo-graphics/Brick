examples - insertion
insert_HABA_inEmptyAt_0
	<gtExample>
	| aTextEditor |
	aTextEditor := self emptyEditor.
	
	aTextEditor insertString: 'HABA' at: 0.
	
	self assert: aTextEditor text asString equals: 'HABA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 4).

	^ aTextEditor