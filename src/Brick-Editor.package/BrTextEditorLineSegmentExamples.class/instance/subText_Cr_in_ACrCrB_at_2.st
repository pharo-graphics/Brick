insertion - sub text
subText_Cr_in_ACrCrB_at_2
	<gtExample>
	| subText aBrText aSegmentBuilder |
	aBrText := self text_ACrCrB.
	aSegmentBuilder := self lineSegmentBuilder.
	
	subText := aSegmentBuilder insertedStringSubText: String cr at: 2 in: aBrText.
	
	self assert: subText start equals: 2.
	self assert: subText end equals: 3.

	^ subText