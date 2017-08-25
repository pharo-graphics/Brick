insertion - sub text
subText_Cr_in_ACrCrB: aBrText at_2_: aSegmentBuilder
	<gtExample>
	<dependsOn: #text_ACrCrB>
	<dependsOn: #lineSegmentBuilder>
	| subText |
	
	subText := aSegmentBuilder insertedStringSubText: String cr at: 2 in: aBrText.
	
	self assert: subText start equals: 2.
	self assert: subText end equals: 3.

	^ subText