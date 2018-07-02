instance creation
newSegment: aBrText from: aStartIndex to: anEndIndex delimited: aDelimiterIndex
	| aText anAbsoluteTextStart anAbsoluteTextEnd |

	aText := aBrText
		from: aStartIndex
		to: anEndIndex.

	anAbsoluteTextStart := (aText allSatisfy: #isLineBreak)
		ifTrue: [ aStartIndex ]
		ifFalse: [ ((aStartIndex - 1) max: 0) ].

	anAbsoluteTextEnd := anEndIndex.

	^ self newSegment
		initializeWith: (aBrText from: aStartIndex to: anEndIndex)
		from: anAbsoluteTextStart + aBrText textOffset
		to: anAbsoluteTextEnd + aBrText textOffset