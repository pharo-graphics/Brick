Class {
	#name : #BrTextEditorLineSegment,
	#superclass : #BrTextEditorSegment,
	#instVars : [
		'pieces',
		'lineSpacing',
		'wordPadding',
		'paragraphMargin'
	],
	#category : #'Brick-Editor-Model - Segment-Text-Line'
}

{ #category : #'instance creation' }
BrTextEditorLineSegment >> adornmentPiece: aText with: anAdornmentAttribute [
	"Create and return a segment piece with adornment"
	<return: #BrTextEditorLineSegmentPiece>

	^ BrTextEditorAttributedLineSegmentAdornmentPiece new
		text: aText;
		adornmentAttribute: anAdornmentAttribute
]

{ #category : #'pieces - computation' }
BrTextEditorLineSegment >> clearCache [
	"Clear all caches and make this segment fresh as if it would just be created and initalized"
	super clearCache.

	pieces := nil
]

{ #category : #'pieces - computation' }
BrTextEditorLineSegment >> computedPieces [
	<return: #SequenceableCollection of: #BrTextEditorLineSegmentPiece>
	| thePieces |

	thePieces := Array streamContents: [ :aStream |
		| lineIterator |

		lineIterator := self text iterator.
		[ lineIterator hasNext ] whileTrue: [
			self nextSegmentPiece: lineIterator in: aStream ] ].

	thePieces := thePieces
		ifEmpty:[ { self textPiece: (self text from: 0 to: 0) } ]
		ifNotEmpty: #yourself.
		
	thePieces do: [ :eachPiece | eachPiece segment: self ].
	^ thePieces
]

{ #category : #testing }
BrTextEditorLineSegment >> hasPieces [
	^ pieces isNotNil
]

{ #category : #initialization }
BrTextEditorLineSegment >> initialize [
	super initialize.

	lineSpacing := 0.
	wordPadding := BlInsets top: 3 bottom: 3.
	paragraphMargin := BlInsets empty
]

{ #category : #initialization }
BrTextEditorLineSegment >> initializeWith: aBrText from: aTextStart to: aTextEnd [
	| theParagraphAttributes |

	super initializeWith: aBrText from: aTextStart to: aTextEnd.

	theParagraphAttributes := aBrText iterator selectAttributes: #isParagraphAttribute.
	theParagraphAttributes do: [ :aParagraphAttribute | aParagraphAttribute applyOn: self ]
]

{ #category : #'pieces - computation' }
BrTextEditorLineSegment >> itemValueType: anObject [
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

{ #category : #'attributes - paragraph' }
BrTextEditorLineSegment >> lineSpacing [
	<return: #Number>

	^ lineSpacing
]

{ #category : #'attributes - paragraph' }
BrTextEditorLineSegment >> lineSpacing: aNumber [
	lineSpacing := aNumber
]

{ #category : #'text - modifications' }
BrTextEditorLineSegment >> moveTextBy: aNumber [
	super moveTextBy: aNumber.

	"no pieces created (they were not requested yet so no need to move them)"
	self hasPieces
		ifFalse: [ ^ self ].

	self pieces
		do: [ :aTextPiece | aTextPiece start: aTextPiece start + aNumber end: aTextPiece end + aNumber ]
]

{ #category : #'pieces - computation' }
BrTextEditorLineSegment >> nextAdornment: aBrTextIterator [
	<return: #BlSubText>

	^  aBrTextIterator nextSegment: [ :aCharacter |
			aBrTextIterator selectAttributes: [ :anAttribute |
				anAttribute isParagraphAttribute not
					and: [ anAttribute isAdornment ] ] ]
]

{ #category : #'pieces - computation' }
BrTextEditorLineSegment >> nextSegmentPiece: aBrTextIterator in: aStream [
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
BrTextEditorLineSegment >> nextSpan: aBrTextIterator in: aStream [
	| aSpanText |
	
	aSpanText := aBrTextIterator nextSegment: [ :aCharacter | aBrTextIterator selectAttributes: #isEventHandler ].
	aStream nextPut: (self textPiece: aSpanText)
]

{ #category : #'pieces - computation' }
BrTextEditorLineSegment >> nextWord: aBrTextIterator [
	<return: #BlSubText>

	^  aBrTextIterator nextSegment: [ :aCharacter | self itemValueType: aCharacter ]
]

{ #category : #'attributes - paragraph' }
BrTextEditorLineSegment >> paragraphMargin [
	<return: #BlInsets>

	^ paragraphMargin
]

{ #category : #'attributes - paragraph' }
BrTextEditorLineSegment >> paragraphMargin: aBlInsets [
	paragraphMargin := aBlInsets
]

{ #category : #accessing }
BrTextEditorLineSegment >> pieces [
	<return: #Array of: #BlSubText>

	^ self hasPieces
		ifTrue: [ pieces ]
		ifFalse: [ pieces := self computedPieces ]
]

{ #category : #accessing }
BrTextEditorLineSegment >> segmentType [
	"Return a type of this segment responsible for creation
	of segment holder and also used as a key for caching purposes"
	<return: #BrEditorSegmentType>
	
	^ BrTextEditorLineSegmentType uniqueInstance
]

{ #category : #'instance creation' }
BrTextEditorLineSegment >> textPiece: aText [
	"Create and return a text segment piece"
	<return: #BrTextEditorLineSegmentPiece>

	^ BrTextEditorLineSegmentTextPiece new text: aText
]

{ #category : #'attributes - paragraph' }
BrTextEditorLineSegment >> wordPadding [
	<return: #BlInsets>

	^ wordPadding
]

{ #category : #'attributes - paragraph' }
BrTextEditorLineSegment >> wordPadding: aBlInsets [
	wordPadding := aBlInsets
]
