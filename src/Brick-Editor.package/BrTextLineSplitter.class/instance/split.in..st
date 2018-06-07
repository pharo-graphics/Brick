private
split: aBrBlob in: aBrEditorSegmentStream
	| anIterator aPreviousSegment aPreviousSeparator |
	
	aPreviousSegment := nil.
	aPreviousSeparator := nil.

	anIterator := aBrBlob text iterator.
	
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
				aSegment := BrSegment new text: aText.
				aPreviousSeparator
					ifNotNil: [ aSegment previousSeparator: aPreviousSeparator ].
				aPreviousSegment := aSegment.
				aBrEditorSegmentStream nextPut: aSegment ] ]