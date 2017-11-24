insertion - builder split
split_Cr
	<gtExample>
	| aText aSegmentBuilder aStream |

	aText := self text_Cr.
	aSegmentBuilder := self lineSegmentBuilder.
	aStream := self segmentStream.

	aSegmentBuilder split: aText in: aStream.

	self assert: aStream segments size equals: 2.
	self assert: aStream segments first textInterval equals: (0 to: 0).
	self assert: aStream segments second textInterval equals: (1 to: 1).

	^ aStream