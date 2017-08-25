insertion - sub text
subText_B_in_BA: aBrText at_0_: aSegmentBuilder
	<gtExample>
	<dependsOn: #text_BA>
	<dependsOn: #lineSegmentBuilder>
	| subText |
	
	subText := aSegmentBuilder insertedStringSubText: 'B' at: 0 in: aBrText.
	
	self assert: subText start equals: 1.
	self assert: subText end equals: 2.
	
	^ subText