insertion - sub text
subText_Cr_in_ACrCr_at_1
	<gtExample>
	| subText aBrText aSegmentBuilder |
	aBrText := self text_ACrCr.
	aSegmentBuilder := self lineSegmentBuilder.
	
	subText := aSegmentBuilder insertedStringSubText: String cr at: 1 in: aBrText.
	
	self assert: subText start equals: 1.
	self assert: subText end equals: 2.

	^ subText