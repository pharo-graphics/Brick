examples - split
split_haCrCrbaCr
	<gtExample>
	| aText aSplitter aStream |

	aText := ('ha', String cr, String cr, 'ba', String cr) asRopedText.
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 4.
	self assert: aStream segments first textStart equals: 0.
	self assert: aStream segments first textEnd equals: 2.
	
	self assert: aStream segments second textStart equals: 3.
	self assert: aStream segments second textEnd equals: 3.
	
	self assert: aStream segments third textStart equals: 4.
	self assert: aStream segments third textEnd equals: 6.
	
	self assert: aStream segments fourth textStart equals: 7.
	self assert: aStream segments fourth textEnd equals: 7.

	^ aStream