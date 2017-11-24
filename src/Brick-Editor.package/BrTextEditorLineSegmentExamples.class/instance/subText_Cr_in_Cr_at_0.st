insertion - sub text
subText_Cr_in_Cr_at_0
	<gtExample>
	| subText aBrText aSegmentBuilder |
	aBrText := self text_Cr.
	aSegmentBuilder := self lineSegmentBuilder.
	
	subText := aSegmentBuilder insertedStringSubText: String cr at: 0 in: aBrText.
	
	self assert: subText start equals: 1.
	self assert: subText end equals: 1.
	
	^ subText