"
I split a piece of text into line segments ${class:BrTextEditorLineSegment}$
"
Class {
	#name : #BrTextEditorLineSplitter,
	#superclass : #BrTextEditorSplitter,
	#category : #'Brick-Editor-Model - Segment-Text-Line'
}

{ #category : #'instance creation' }
BrTextEditorLineSplitter >> newSegment [
	^ BrTextEditorLineSegment new
]

{ #category : #'instance creation' }
BrTextEditorLineSplitter >> newSegment: aBlText from: aStartIndex to: anEndIndex delimited: aDelimiterIndex offset: anOffset [
	| aText anAbsoluteTextStart anAbsoluteTextEnd |

	aText := aBlText
		from: aStartIndex
		to: anEndIndex.
	
	anAbsoluteTextStart := (aText allSatisfy: #isLineBreak)
		ifTrue: [ aStartIndex ]
		ifFalse: [ ((aStartIndex - 1) max: 0) ].

	anAbsoluteTextEnd := anEndIndex.

	^ self newSegment
		initializeWith: aText
		from: anAbsoluteTextStart + anOffset
		to: anAbsoluteTextEnd + anOffset
]

{ #category : #'api - splitting' }
BrTextEditorLineSplitter >> split: aBrText in: aBrEditorSegmentStream offset: anOffset [
	| anIterator |

	aBrText isEmpty
		ifTrue: [ ^ aBrEditorSegmentStream nextPut: (self newSegment: aBrText from: 0 to: 0 delimited: 0 offset: anOffset) ].

	anIterator := aBrText iterator.

	[ anIterator hasNext and: [ aBrEditorSegmentStream wantsMore ] ] whileTrue: [
		anIterator
			nextLineIndicesDo: [ :aLineStart :aLineEnd :aLineDelimiterEnd |
				aBrEditorSegmentStream nextPut: (self newSegment: aBrText from: aLineStart to: aLineEnd delimited: aLineDelimiterEnd offset: anOffset) ]
			shouldMerge: [ :aLineStart :aLineEnd :aLineDelimiterEnd |
				(aBrText from: aLineEnd + 1 to: aLineDelimiterEnd) iterator
					detectAttribute: [ :eachAttribute | self wantsToMergeSegments: eachAttribute ]
					ifFound: [ true ]
					ifNone: [ false ] ] ].

	(aBrEditorSegmentStream wantsMore and: [ aBrText last isLineBreak ])
		ifTrue: [ aBrEditorSegmentStream nextPut: (self newSegment: aBrText from: aBrText size to: aBrText size delimited: aBrText size offset: anOffset) ]
]

{ #category : #testing }
BrTextEditorLineSplitter >> wantsToMergeSegments: aTextAttribute [
	"Return true if a given attribute should merge segments and ignore a new line"
	<return: #Boolean>

	^ aTextAttribute isAdornment and: [ aTextAttribute shouldReplace ]
]
