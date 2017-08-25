insertion - sub text
subText_Cr_in_ACrCrB: aBrText at_1_: aSegmentBuilder
	<gtExample>
	<dependsOn: #text_ACrCrB>
	<dependsOn: #lineSegmentBuilder>
	| subText |
	
	subText := aSegmentBuilder insertedStringSubText: String cr at: 1 in: aBrText.
	
	self assert: subText start equals: 1.
	self assert: subText end equals: 2.

	^ subText