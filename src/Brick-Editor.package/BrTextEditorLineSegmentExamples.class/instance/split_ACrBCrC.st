insertion - builder split
split_ACrBCrC
	<gtExample>
	| aText aSegmentBuilder aStream |

	aText := self text_ACrBCrC.
	aSegmentBuilder := self lineSegmentBuilder.
	aStream := self segmentStream.
	
	aSegmentBuilder split: aText in: aStream.

	self assert: aStream segments size equals: 3.
	self assert: aStream segments first textInterval equals: (1 to: 1).
	self assert: aStream segments second textInterval equals: (3 to: 3).
	self assert: aStream segments third textInterval equals: (5 to: 5).

	^ aStream