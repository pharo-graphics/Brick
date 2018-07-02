examples - split subtext
split_Hello_from_HabaHelloFoo
	<gtExample>
	| aText aSubText aSplitter aStream |

	aText := 'HabaHelloFoo' asRopedText.
	aSubText := aText from: 5 to: 9.
	
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aSubText in: aStream.

	self assert: aStream segments size equals: 1.
	self assert: aStream segments first textStart equals: 4.
	self assert: aStream segments first textEnd equals: 9.

	^ aStream