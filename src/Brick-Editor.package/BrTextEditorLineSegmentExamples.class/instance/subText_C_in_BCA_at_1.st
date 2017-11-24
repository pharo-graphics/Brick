insertion - sub text
subText_C_in_BCA_at_1
	<gtExample>
	| subText aBrText aSegmentBuilder |
	aBrText := self text_BCA.
	aSegmentBuilder := self lineSegmentBuilder.

	subText := aSegmentBuilder insertedStringSubText: 'C' at: 1 in: aBrText.
	
	self assert: subText start equals: 1.
	self assert: subText end equals: 3.
	
	^ subText