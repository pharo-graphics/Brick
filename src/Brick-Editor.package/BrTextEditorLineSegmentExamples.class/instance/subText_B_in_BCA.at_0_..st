insertion - sub text
subText_B_in_BCA: aBrText at_0_: aSegmentBuilder
	<gtExample>
	<dependsOn: #text_BCA>
	<dependsOn: #lineSegmentBuilder>
	| subText |

	subText := aSegmentBuilder insertedStringSubText: 'B' at: 0 in: aBrText.
	
	self assert: subText start equals: 1.
	self assert: subText end equals: 2.
	
	^ subText