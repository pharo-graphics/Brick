insertion - sub text
subText_C_in_BCA: aBrText at_1_: aSegmentBuilder
	<gtExample>
	<dependsOn: #text_BCA>
	<dependsOn: #lineSegmentBuilder>
	| subText |

	subText := aSegmentBuilder insertedStringSubText: 'C' at: 1 in: aBrText.
	
	self assert: subText start equals: 1.
	self assert: subText end equals: 3.
	
	^ subText