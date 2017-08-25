insertion - sub text
subText_0_in_1234506789: aBrText at_5_: aSegmentBuilder
	<gtExample>
	<dependsOn: #text_1234506789>
	<dependsOn: #lineSegmentBuilder>
	| subText |

	subText := aSegmentBuilder insertedStringSubText: '0' at: 5 in: aBrText.

	self assert: subText start equals: 5.
	self assert: subText end equals: 7.

	^ subText