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

	thePieces := BrTextEditorLineSegmentSplitter new split: self text.	
	thePieces do: [ :eachPiece | eachPiece segment: self ].

	^ thePieces
]

{ #category : #testing }
BrTextEditorLineSegment >> hasPieces [
	<return: #Boolean>

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

{ #category : #testing }
BrTextEditorLineSegment >> isLastTextPiece: aSegmentPiece [
	<return: #Boolean>
	
	self hasPieces
		ifFalse: [ ^ false ].

	self pieces reverseDo: [ :eachPiece |
		eachPiece isText ifTrue: [ ^ eachPiece == aSegmentPiece ] ].
	
	^ false
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
	<return: #Array of: #BrTextEditorLineSegmentPiece>

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

{ #category : #'attributes - paragraph' }
BrTextEditorLineSegment >> wordPadding [
	<return: #BlInsets>

	^ wordPadding
]

{ #category : #'attributes - paragraph' }
BrTextEditorLineSegment >> wordPadding: aBlInsets [
	wordPadding := aBlInsets
]
