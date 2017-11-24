insertion - sub text
subText_A_in_CrA_at_1
	<gtExample>
	| subText aBrText aSegmentBuilder |
	aBrText := self text_CrA.
	aSegmentBuilder := self lineSegmentBuilder.
	
	subText := aSegmentBuilder insertedStringSubText: 'A' at: 1 in: aBrText.
	
	self assert: subText start equals: 2.
	self assert: subText end equals: 2.

	^ subText