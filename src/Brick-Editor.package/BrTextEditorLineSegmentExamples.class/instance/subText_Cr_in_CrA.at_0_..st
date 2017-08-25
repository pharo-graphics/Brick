insertion - sub text
subText_Cr_in_CrA: aBrText at_0_: aSegmentBuilder
	<gtExample>
	<dependsOn: #text_CrA>
	<dependsOn: #lineSegmentBuilder>
	| subText |
	
	subText := aSegmentBuilder insertedStringSubText: String cr at: 0 in: aBrText.
	
	self assert: subText start equals: 1.
	self assert: subText end equals: 2.

	^ subText