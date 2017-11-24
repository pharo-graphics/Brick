insertion - sub text
subText_B_in_ACrCrB_at_3
	<gtExample>
	| subText aBrText aSegmentBuilder |
	aBrText := self text_ACrCrB.
	aSegmentBuilder := self lineSegmentBuilder.
	
	subText := aSegmentBuilder insertedStringSubText: 'B' at: 3 in: aBrText.
	
	self assert: subText start equals: 4.
	self assert: subText end equals: 4.

	^ subText