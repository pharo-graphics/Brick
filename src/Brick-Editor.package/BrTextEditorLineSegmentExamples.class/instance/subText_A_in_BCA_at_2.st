insertion - sub text
subText_A_in_BCA_at_2
	<gtExample>
	| subText aBrText aSegmentBuilder |
	aBrText := self text_BCA.
	aSegmentBuilder := self lineSegmentBuilder.

	subText := aSegmentBuilder insertedStringSubText: 'A' at: 2 in: aBrText.
	
	self assert: subText start equals: 2.
	self assert: subText end equals: 3.
	
	^ subText