insertion
insert_Hello_inEmptyAt_0
	<gtExample>
	| aTextEditor |
	aTextEditor := self emptyEditor.

	aTextEditor insertString: 'Hello' at: 0.

	self assert: aTextEditor text asString equals: 'Hello'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 5).

	^ aTextEditor