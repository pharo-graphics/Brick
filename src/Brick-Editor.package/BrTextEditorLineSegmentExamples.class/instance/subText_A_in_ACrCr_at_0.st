insertion - sub text
subText_A_in_ACrCr_at_0
	<gtExample>
	| subText aBrText aSegmentBuilder |
	aBrText := self text_ACrCr.
	aSegmentBuilder := self lineSegmentBuilder.

	subText := aSegmentBuilder insertedStringSubText: 'A' at: 0 in: aBrText.

	self assert: subText start equals: 1.
	self assert: subText end equals: 1.

	^ subText