Class {
	#name : #BrTextEditorParagraphSegment,
	#superclass : #BrTextEditorSegment,
	#instVars : [
		'pieces',
		'lineSpacing',
		'wordPadding',
		'paragraphMargin'
	],
	#category : #'Brick-Editor-Model - Segment-Text-Paragraph'
}

{ #category : #'pieces - computation' }
BrTextEditorParagraphSegment >> clearCache [
	"Clear all caches and make this segment fresh as if it would just be created and initalized"
	super clearCache.

	pieces := nil
]

{ #category : #'pieces - computation' }
BrTextEditorParagraphSegment >> computedPieces [
	<return: #SequenceableCollection of: #BrTextEditorLineSegmentPiece>
	| thePieces |

	thePieces := BrTextEditorParagraphSegmentSplitter new
		split: self text
		from: self textStart
		to: self textEnd.
	thePieces do: [ :eachPiece | eachPiece segment: self ].

	^ thePieces
]

{ #category : #'as yet unclassified' }
BrTextEditorParagraphSegment >> gtInfoFor: aView [
	<gtView>

	^ ({
		#index -> index.
		#text -> self text.
		#textStart -> self textStart.
		#textEnd -> self textEnd.
		#lineSpacing -> self lineSpacing.
		#wordPadding -> self wordPadding.
		#paragraphMargin -> self paragraphMargin.
	 } asOrderedDictionary gtItemsFor: aView)
			title: 'Info';
			priority: 2
]

{ #category : #'as yet unclassified' }
BrTextEditorParagraphSegment >> gtPiecesFor: aView [
	<gtView>

	^ aView columnedList
		title: 'Pieces';
		items: [ self pieces ];
		priority: 5;
		column: 'Interval' item: [ :each | (each textStart to: each textEnd) asString ];
		column: 'Text' item: [ :each | each ]
]

{ #category : #testing }
BrTextEditorParagraphSegment >> hasPieces [
	<return: #Boolean>

	^ pieces isNotNil
]

{ #category : #initialization }
BrTextEditorParagraphSegment >> initialize [
	super initialize.

	self resetProperties
]

{ #category : #testing }
BrTextEditorParagraphSegment >> isLastTextPiece: aSegmentPiece [
	<return: #Boolean>
	
	self hasPieces
		ifFalse: [ ^ false ].

	self pieces reverseDo: [ :eachPiece |
		eachPiece isText ifTrue: [ ^ eachPiece == aSegmentPiece ] ].
	
	^ false
]

{ #category : #'attributes - paragraph' }
BrTextEditorParagraphSegment >> lineSpacing [
	<return: #Number>

	^ lineSpacing
]

{ #category : #'attributes - paragraph' }
BrTextEditorParagraphSegment >> lineSpacing: aNumber [
	lineSpacing := aNumber
]

{ #category : #'text - modifications' }
BrTextEditorParagraphSegment >> moveTextBy: aNumber [
	super moveTextBy: aNumber.

	"no pieces created (they were not requested yet so no need to move them)"
	self hasPieces
		ifFalse: [ ^ self ].

	self pieces
		do: [ :aTextPiece | aTextPiece start: aTextPiece textStart + aNumber end: aTextPiece textEnd + aNumber ]
]

{ #category : #'text - modifications' }
BrTextEditorParagraphSegment >> moveTextPiecesBy: aNumber at: aTextIndex [
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
BrTextEditorParagraphSegment >> paragraphMargin [
	<return: #BlInsets>

	^ paragraphMargin
]

{ #category : #'attributes - paragraph' }
BrTextEditorParagraphSegment >> paragraphMargin: aBlInsets [
	paragraphMargin := aBlInsets
]

{ #category : #accessing }
BrTextEditorParagraphSegment >> pieces [
	<return: #Array of: #BrTextEditorLineSegmentPiece>

	^ self hasPieces
		ifTrue: [ pieces ]
		ifFalse: [ pieces := self computedPieces ]
]

{ #category : #initialization }
BrTextEditorParagraphSegment >> resetProperties [
	lineSpacing := 0.
	wordPadding := BlInsets empty.
	paragraphMargin := BlInsets empty.
]

{ #category : #accessing }
BrTextEditorParagraphSegment >> segmentType [
	"Return a type of this segment responsible for creation
	of segment holder and also used as a key for caching purposes"
	<return: #BrEditorSegmentType>
	
	^ BrTextEditorParagraphSegmentType uniqueInstance
]

{ #category : #'text - modifications' }
BrTextEditorParagraphSegment >> updateSegmentProperties [
	| theParagraphAttributes |
	
	self resetProperties.
	
	theParagraphAttributes := text iterator selectAttributes: #isParagraphAttribute.
	theParagraphAttributes do: [ :aParagraphAttribute |
		aParagraphAttribute applyOn: self ]
]

{ #category : #'attributes - paragraph' }
BrTextEditorParagraphSegment >> wordPadding [
	<return: #BlInsets>

	^ wordPadding
]

{ #category : #'attributes - paragraph' }
BrTextEditorParagraphSegment >> wordPadding: aBlInsets [
	wordPadding := aBlInsets
]
