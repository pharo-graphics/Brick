private
split: aBrText in: aBrEditorSegmentStream
	| anIterator aPreviousSegment aPreviousSeparator |
	
	aBrText isEmpty
		ifTrue: [ ^ aBrEditorSegmentStream nextPut: (BrSegment new initializeWith: (aBrText from: 0 to: 0) from: 0 to: 0) ].

	aPreviousSegment := nil.
	aPreviousSeparator := nil.

	anIterator := aBrText iterator.

	[ anIterator hasNext and: [ aBrEditorSegmentStream wantsMore ] ] whileTrue: [
		| aText |
		aText := anIterator nextSegment: [ :aCharacter | aCharacter isLineBreak ].
		aText first isLineBreak
			ifTrue: [
				| aSeparator |
				aSeparator := BrSeparator new text: aText.
				aPreviousSegment
					ifNotNil: [ aPreviousSegment nextSeparator: aSeparator ].
				aPreviousSeparator := aSeparator ]
			ifFalse: [
				| aSegment |
				aSegment := BrSegment new
					initializeWith: aText
					from: aText start
					to: aText end.
				aPreviousSeparator
					ifNotNil: [ aSegment previousSeparator: aPreviousSeparator ].
				aPreviousSegment := aSegment.
				aBrEditorSegmentStream nextPut: aSegment ] ]