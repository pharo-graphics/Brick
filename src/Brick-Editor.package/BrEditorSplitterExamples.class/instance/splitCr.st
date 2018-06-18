examples - split
splitCr
	<gtExample>
	| aText aSplitter aStream |

	aText := String cr asRopedText.
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 2.
	self assert: aStream segments first textStart equals: 0.
	self assert: aStream segments first textEnd equals: 0.
	self assert: aStream segments first isAfterSeparator not.
	self assert: aStream segments first isBeforeSeparator.
	
	self assert: aStream segments second textStart equals: 1.
	self assert: aStream segments second textEnd equals: 1.
	self assert: aStream segments second isAfterSeparator.
	self assert: aStream segments second isBeforeSeparator not.

	^ aStream