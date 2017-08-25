insertion - sub text
subText_A_in_A: aBrText at_0_: aSegmentBuilder
	<gtExample>
	<dependsOn: #text_A>
	<dependsOn: #lineSegmentBuilder>
	| subText |
	
	subText := aSegmentBuilder insertedStringSubText: 'A' at: 0 in: aBrText.
	
	self assert: subText start equals: 1.
	self assert: subText end equals: 1.
	
	^ subText