insertion - sub text
subText_0_in_1234506789_at_5
	<gtExample>
	| subText aBrText aSegmentBuilder |
	aBrText := self text_1234506789.
	aSegmentBuilder := self lineSegmentBuilder.

	subText := aSegmentBuilder insertedStringSubText: '0' at: 5 in: aBrText.

	self assert: subText start equals: 5.
	self assert: subText end equals: 7.

	^ subText