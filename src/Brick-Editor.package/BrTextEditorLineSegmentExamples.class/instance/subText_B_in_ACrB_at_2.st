insertion - sub text
subText_B_in_ACrB_at_2
	<gtExample>
	| subText aBrText aSegmentBuilder |
	aBrText := self text_ACrB.
	aSegmentBuilder := self lineSegmentBuilder.
	
	subText := aSegmentBuilder insertedStringSubText: 'B' at: 2 in: aBrText.
	
	self assert: subText start equals: 3.
	self assert: subText end equals: 3.

	^ subText