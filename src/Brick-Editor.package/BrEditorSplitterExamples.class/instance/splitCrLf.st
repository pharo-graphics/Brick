examples - split
splitCrLf
	<gtExample>
	| aText aSplitter aStream |

	aText := (String cr, String lf) asRopedText.
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 1.
	self assert: aStream segments first textStart equals: 0.
	self assert: aStream segments first textEnd equals: 0.
	self assert: aStream segments first isAfterSeparator not.
	self assert: aStream segments first isBeforeSeparator not.

	^ aStream