insertion - sub text
subText_A_in_BCA: aBrText at_2_: aSegmentBuilder
	<gtExample>
	<dependsOn: #text_BCA>
	<dependsOn: #lineSegmentBuilder>
	| subText |

	subText := aSegmentBuilder insertedStringSubText: 'A' at: 2 in: aBrText.
	
	self assert: subText start equals: 2.
	self assert: subText end equals: 3.
	
	^ subText