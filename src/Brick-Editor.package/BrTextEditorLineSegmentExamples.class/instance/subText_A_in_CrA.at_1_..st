insertion - sub text
subText_A_in_CrA: aBrText at_1_: aSegmentBuilder
	<gtExample>
	<dependsOn: #text_CrA>
	<dependsOn: #lineSegmentBuilder>
	| subText |
	
	subText := aSegmentBuilder insertedStringSubText: 'A' at: 1 in: aBrText.
	
	self assert: subText start equals: 2.
	self assert: subText end equals: 2.

	^ subText