insertion - sub text
subText_A_in_ACr: aBrText at_0_: aSegmentBuilder
	<gtExample>
	<dependsOn: #text_ACr>
	<dependsOn: #lineSegmentBuilder>
	| subText |
	
	subText := aSegmentBuilder insertedStringSubText: 'A' at: 0 in: aBrText.
	
	self assert: subText start equals: 1.
	self assert: subText end equals: 1.

	^ subText