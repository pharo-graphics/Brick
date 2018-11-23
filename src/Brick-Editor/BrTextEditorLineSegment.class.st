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

	^ BrTextEditorLineSegmentAdornmentPiece new
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
			self processSegment: lineIterator in: aStream ] ].

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

{ #category : #'private - pieces computation' }
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

{ #category : #'private - pieces computation' }
BrTextEditorLineSegment >> processAdornmentAttribute: anAdornmentAttribute of: aText in: aStream [
	aStream nextPut: (self adornmentPiece: aText with: anAdornmentAttribute)
]

{ #category : #'private - pieces computation' }
BrTextEditorLineSegment >> processPureWords: aTextIterator in: aStream [
	"Process a text within a scope of the given iterator as if it does not contain any adornment attributes
	nor event handling attributes. At this point we should just split it in words based on the text separator
	such as space or some other characters abnd create a text piece for each `word`"
	| aWord |
	
	aWord := aTextIterator nextSegment: [ :aCharacter | self itemValueType: aCharacter ].
	aStream nextPut: (self textPiece: aWord)
]

{ #category : #'private - pieces computation' }
BrTextEditorLineSegment >> processSegment: aTextIterator in: aStream [
	
	aTextIterator
		nextSpanAny: [ :eachAttribute | eachAttribute isAdornment and: [ eachAttribute shouldReplace ] ]
		indicesDo: [ :aStart :anEnd :hasReplacements | 
			| aSpanIterator |
			aSpanIterator := (aTextIterator text
				from: aStart
				to: anEnd) iterator.
			[ aSpanIterator hasNext ]
				whileTrue: [
					hasReplacements
						ifTrue: [ self processWithReplacements: aSpanIterator in: aStream ]
						ifFalse: [ self processWithoutReplacements: aSpanIterator in: aStream ] ] ]
]

{ #category : #'private - pieces computation' }
BrTextEditorLineSegment >> processWithReplacements: aTextIterator in: aStream [
	"There is at least one replacement attribute applied on every character within the scope of the given text iterator"
	
	aTextIterator
		nextAttributedEnd: [ :eachAttribute | eachAttribute isAdornment ]
		indicesDo: [ :aStart :anEnd :theAdornmentAttributes |
			| anAdornmentSpan theAttributes |
			
			theAttributes := theAdornmentAttributes
				ifEmpty: [ aTextIterator attributes
					select: [ :eachAttribute | eachAttribute isAdornment and: [ eachAttribute shouldReplace ] ] ].
			
			anAdornmentSpan := aTextIterator text from: aStart to: anEnd.
			theAttributes do: [ :eachAttribute |
				self
					processAdornmentAttribute: eachAttribute
					of: anAdornmentSpan
					in: aStream ] ]
]

{ #category : #'private - pieces computation' }
BrTextEditorLineSegment >> processWithoutAdornments: aTextIterator in: aStream [
	"Process a text within the scope of the given iterator as there are no adornment attributes.
	Now that adornment attributes are filtered we can split text into pieces based on the presence of
	event handling attributes. Every combination of event handling elements should be a separate text piece
	with its own unique visual element"

	aTextIterator
		nextSpan: [ :eachAttribute | eachAttribute isEventHandler ]
		indicesDo: [ :aStart :anEnd :theEventHandlerAttributes | 
			| aSpan aSpanIterator |
			aSpan := aTextIterator text
				from: aStart
				to: anEnd.
			aSpanIterator := aSpan iterator.
			[ aSpanIterator hasNext ] whileTrue: [
				self processPureWords: aSpanIterator in: aStream ] ]
]

{ #category : #'private - pieces computation' }
BrTextEditorLineSegment >> processWithoutReplacements: aTextIterator in: aStream [
	"There are no replacement attributes within the scope of the given iterator"

	aTextIterator
		nextAttributedEnd: [ :eachAttribute | eachAttribute isAdornment and: [ eachAttribute shouldAppend ] ]
		indicesDo: [ :aStart :anEnd :theEndedAttributes |
			| aSpan aSpanIterator |
			aSpan := aTextIterator text from: aStart to: anEnd.
			aSpanIterator := aSpan iterator.
			[ aSpanIterator hasNext ] whileTrue: [
				self processWithoutAdornments: aSpanIterator in: aStream ].
			
			theEndedAttributes do: [ :eachAttribute |
				self
					processAdornmentAttribute: eachAttribute
					of: aSpan
					in: aStream ] ]
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
