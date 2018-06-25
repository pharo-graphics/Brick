private
split: aBrText in: aBrEditorSegmentStream
	| anIterator |

	aBrText isEmpty
		ifTrue: [ ^ aBrEditorSegmentStream nextPut: (BrSegment new initializeWith: (aBrText from: 0 to: 0) from: 0 to: 0) ].

	anIterator := aBrText iterator.

	[ anIterator hasNext and: [ aBrEditorSegmentStream wantsMore ] ] whileTrue: [		
		anIterator nextLineIndicesDo: [ :aLineStart :aLineEnd :aLineDelimiterEnd |
			aBrEditorSegmentStream nextPut: (BrSegment new
				initializeWith: (aBrText from: aLineStart to: aLineEnd)
				from: aLineStart
				to: aLineEnd) ] ].

	(aBrEditorSegmentStream wantsMore and: [ aBrText last isLineBreak ])
		ifTrue: [
			aBrEditorSegmentStream nextPut: (BrSegment new
				initializeWith: (aBrText from: aBrText size to: aBrText size)
				from: aBrText size
				to: aBrText size) ]