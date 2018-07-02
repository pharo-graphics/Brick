api - splitting
split: aBrText in: aBrEditorSegmentStream
	| anIterator |

	aBrText isEmpty
		ifTrue: [ ^ aBrEditorSegmentStream nextPut: (self newSegment: aBrText from: 0 to: 0 delimited: 0) ].

	anIterator := aBrText iterator.

	[ anIterator hasNext and: [ aBrEditorSegmentStream wantsMore ] ] whileTrue: [		
		anIterator nextLineIndicesDo: [ :aLineStart :aLineEnd :aLineDelimiterEnd |
			aBrEditorSegmentStream nextPut: (self newSegment: aBrText from: aLineStart to: aLineEnd delimited: aLineDelimiterEnd) ] ].

	(aBrEditorSegmentStream wantsMore and: [ aBrText last isLineBreak ])
		ifTrue: [ aBrEditorSegmentStream nextPut: (self newSegment: aBrText from: aBrText size to: aBrText size delimited: aBrText size) ]