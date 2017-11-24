insertion - sub text
subText_B_in_BA_at_0
	<gtExample>
	| subText aBrText aSegmentBuilder |
	aBrText := self text_BA.
	aSegmentBuilder := self lineSegmentBuilder.
	
	subText := aSegmentBuilder insertedStringSubText: 'B' at: 0 in: aBrText.
	
	self assert: subText start equals: 1.
	self assert: subText end equals: 2.
	
	^ subText