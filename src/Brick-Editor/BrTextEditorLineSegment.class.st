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

	thePieces := BrTextEditorLineSegmentSplitter new
		split: self text
		from: self textStart
		to: self textEnd.
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
	wordPadding := BlInsets empty.
	paragraphMargin := BlInsets empty
]

{ #category : #initialization }
BrTextEditorLineSegment >> initializeWith: aBrText from: aTextStart to: aTextEnd [
	| theParagraphAttributes |
	super initializeWith: aBrText from: aTextStart to: aTextEnd.

	theParagraphAttributes := aBrText iterator selectAttributes: #isParagraphAttribute.
	theParagraphAttributes do: [ :aParagraphAttribute |
		aParagraphAttribute applyOn: self ]
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
		do: [ :aTextPiece | aTextPiece start: aTextPiece textStart + aNumber end: aTextPiece textEnd + aNumber ]
]

{ #category : #'text - modifications' }
BrTextEditorLineSegment >> moveTextPiecesBy: aNumber at: aTextIndex [
	"aTextIndex is a Text index, not a cursor one!"
	| aCursorIndex |
	super moveTextPiecesBy: aNumber at: aTextIndex.
	
	aCursorIndex := (aTextIndex - 1) max: 0.

	"no pieces created (they were not requested yet so no need to move them)"
	self hasPieces
		ifFalse: [ ^ self ].

	self pieces
		do: [ :aTextPiece |
			
			aNumber > 0
				ifTrue: [
					aTextPiece textEnd > aCursorIndex
						ifTrue: [
							aTextPiece textStart > aCursorIndex
								ifTrue: [ aTextPiece
									start: aTextPiece textStart + aNumber
									end: aTextPiece textEnd + aNumber ]
								ifFalse: [ aTextPiece
									start: aTextPiece textStart
									end: aTextPiece textEnd + aNumber ] ] ]
				ifFalse: [
					aTextPiece textEnd > aCursorIndex
						ifTrue: [
							"deletion happened before this text piece"
							aTextPiece textStart > aCursorIndex
								ifTrue: [
									| aLastDeletedIndex |
									aLastDeletedIndex := aCursorIndex + aNumber abs.
									aTextPiece
										start: aCursorIndex
										end: ((aTextPiece textEnd - aLastDeletedIndex) max: aCursorIndex) ]
								"deletion happened inside of this text piece"
								ifFalse: [
									aTextPiece
										start: aTextPiece textStart
										"end is start + how many left after deletion"
										end: aCursorIndex + ((aTextPiece textEnd - aCursorIndex - aNumber abs) max: 0) ] ] ] ]
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
