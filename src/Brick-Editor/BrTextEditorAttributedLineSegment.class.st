"
I am a line-based text segment with support of adornment attributes
"
Class {
	#name : #BrTextEditorAttributedLineSegment,
	#superclass : #BrTextEditorLineSegment,
	#category : #'Brick-Editor-Model - Segment-Text-Line-Attributed'
}

{ #category : #'instance creation' }
BrTextEditorAttributedLineSegment >> adornmentPiece: aText with: anAdornmentAttribute [
	"Create and return a segment piece with adornment"
	<return: #BrTextEditorLineSegmentPiece>

	^ BrTextEditorAttributedLineSegmentAdornmentPiece new
		text: aText;
		adornmentAttribute: anAdornmentAttribute
]

{ #category : #initialization }
BrTextEditorAttributedLineSegment >> initializeWith: aBrText from: aTextStart to: aTextEnd [
	| theParagraphAttributes |

	super initializeWith: aBrText from: aTextStart to: aTextEnd.

	theParagraphAttributes := aBrText iterator selectAttributes: #isParagraphAttribute.
	theParagraphAttributes do: [ :aParagraphAttribute | aParagraphAttribute applyOn: self ]
]

{ #category : #'pieces - computation' }
BrTextEditorAttributedLineSegment >> itemValueType: anObject [
	"Return a type of an item within a segment.
	Note: return value should be never used explicitely, it is only needed
	for direct comparison, therefore can be any immutable object"
	<return: #Symbol>

	^ anObject isCharacter
		ifTrue: [ anObject isSeparator
			ifTrue: [ #separator ]
			ifFalse: [ #letter ] ]
		ifFalse: [ #object ]
]

{ #category : #'pieces - computation' }
BrTextEditorAttributedLineSegment >> nextAdornment: aBrTextIterator [
	<return: #BlSubText>

	^  aBrTextIterator nextSegment: [ :aCharacter |
			aBrTextIterator selectAttributes: [ :anAttribute |
				anAttribute isParagraphAttribute not
					and: [ anAttribute isAdornment ] ] ]
]

{ #category : #'pieces - computation' }
BrTextEditorAttributedLineSegment >> nextSegmentPiece: aBrTextIterator in: aStream [
	| initialAdornments anAdornmentText anAdornmentIterator |

	initialAdornments := aBrTextIterator selectAttributes: [ :anAttribute |
			anAttribute isParagraphAttribute not and: [ anAttribute isAdornment ] ].
	
	anAdornmentText := self nextAdornment: aBrTextIterator.
	
	initialAdornments
		detect: #shouldReplace
		ifFound: [ :aReplacementAttribute |
			^ aStream nextPut: (self adornmentPiece: anAdornmentText with: aReplacementAttribute) ].
	
	anAdornmentIterator := anAdornmentText iterator.
	[ anAdornmentIterator hasNext ] whileTrue: [
		| aWordText aWordTextIterator |
		aWordText := self nextWord: anAdornmentIterator.
		aWordTextIterator := aWordText iterator.
		[ aWordTextIterator hasNext ] whileTrue: [
			self nextSpan: aWordTextIterator in: aStream ] ].

	aStream nextPutAll: (initialAdornments asArray
		select: #shouldAppend
		thenCollect: [ :anAppendingAttribute | self adornmentPiece: anAdornmentText with: anAppendingAttribute ])
]

{ #category : #'pieces - computation' }
BrTextEditorAttributedLineSegment >> nextSpan: aBrTextIterator in: aStream [
	| aSpanText |
	
	aSpanText := aBrTextIterator nextSegment: [ :aCharacter | aBrTextIterator selectAttributes: #isEventHandler ].
	aStream nextPut: (self textPiece: aSpanText)
]

{ #category : #'pieces - computation' }
BrTextEditorAttributedLineSegment >> nextWord: aBrTextIterator [
	<return: #BlSubText>

	^  aBrTextIterator nextSegment: [ :aCharacter | self itemValueType: aCharacter ]
]
