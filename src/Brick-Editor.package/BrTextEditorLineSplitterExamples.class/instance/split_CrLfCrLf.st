examples - split
split_CrLfCrLf
	<gtExample>
	| aText aSplitter aStream |

	aText := (String cr, String lf, String cr, String lf) asRopedText.
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 3.
	self assert: aStream segments first textStart equals: 0.
	self assert: aStream segments first textEnd equals: 0.
	
	self assert: aStream segments second textStart equals: 2.
	self assert: aStream segments second textEnd equals: 2.
	
	self assert: aStream segments third textStart equals: 4.
	self assert: aStream segments third textEnd equals: 4.

	^ aStream