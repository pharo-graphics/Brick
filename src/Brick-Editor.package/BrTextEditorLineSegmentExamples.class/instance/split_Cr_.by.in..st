insertion - builder split
split_Cr_: aBrText by: aSegmentBuilder in: aStream
	<gtExample>
	<dependsOn: #text_Cr>
	<dependsOn: #lineSegmentBuilder>
	<dependsOn: #segmentStream>
	
	aSegmentBuilder split: aBrText in: aStream.

	self assert: aStream segments size equals: 2.
	self assert: aStream segments first textInterval equals: (0 to: 0).
	self assert: aStream segments second textInterval equals: (1 to: 1).

	^ aStream