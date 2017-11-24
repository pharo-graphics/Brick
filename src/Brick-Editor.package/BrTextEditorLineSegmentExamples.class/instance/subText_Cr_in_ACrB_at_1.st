insertion - sub text
subText_Cr_in_ACrB_at_1
	<gtExample>
	<dependsOn: #text_ACrB>
	| subText aBrText aSegmentBuilder |
	aBrText := self text_ACrB.
	aSegmentBuilder := self lineSegmentBuilder.
	
	subText := aSegmentBuilder insertedStringSubText: String cr at: 1 in: aBrText.
	
	self assert: subText start equals: 1.
	self assert: subText end equals: 2.

	^ subText