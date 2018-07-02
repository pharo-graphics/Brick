examples - split
split_Hello
	<gtExample>
	| aText aSplitter aStream |

	aText := 'Hello' asRopedText.
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 1.
	self assert: aStream segments first textStart equals: 0.
	self assert: aStream segments first textEnd equals: 5.

	^ aStream