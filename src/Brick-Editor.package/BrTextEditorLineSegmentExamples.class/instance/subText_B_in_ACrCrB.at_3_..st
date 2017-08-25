insertion - sub text
subText_B_in_ACrCrB: aBrText at_3_: aSegmentBuilder
	<gtExample>
	<dependsOn: #text_ACrCrB>
	<dependsOn: #lineSegmentBuilder>
	| subText |
	
	subText := aSegmentBuilder insertedStringSubText: 'B' at: 3 in: aBrText.
	
	self assert: subText start equals: 4.
	self assert: subText end equals: 4.

	^ subText