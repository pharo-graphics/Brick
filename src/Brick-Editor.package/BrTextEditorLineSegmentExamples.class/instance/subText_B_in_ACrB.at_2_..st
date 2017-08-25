insertion - sub text
subText_B_in_ACrB: aBrText at_2_: aSegmentBuilder
	<gtExample>
	<dependsOn: #text_ACrB>
	<dependsOn: #lineSegmentBuilder>
	| subText |
	
	subText := aSegmentBuilder insertedStringSubText: 'B' at: 2 in: aBrText.
	
	self assert: subText start equals: 3.
	self assert: subText end equals: 3.

	^ subText