examples - split
split_CraCrLfbLf
	<gtExample>
	| aText aSplitter aStream |

	aText := (String cr, 'a', String cr, String lf, 'b', String lf) asRopedText.
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 4.
	self assert: aStream segments first textStart equals: 0.
	self assert: aStream segments first textEnd equals: 0.
	
	self assert: aStream segments second textStart equals: 1.
	self assert: aStream segments second textEnd equals: 2.
	
	self assert: aStream segments third textStart equals: 4.
	self assert: aStream segments third textEnd equals: 5.
	
	self assert: aStream segments fourth textStart equals: 6.
	self assert: aStream segments fourth textEnd equals: 6.

	^ aStream