"
I split a piece of text behind a ${class:BrTextEditorLineSegment}$ into pieces
"
Class {
	#name : #BrTextEditorLineSegmentSplitter,
	#superclass : #Object,
	#category : #'Brick-Editor-Model - Segment-Text-Line'
}

{ #category : #'instance creation' }
BrTextEditorLineSegmentSplitter >> adornmentPiece: aText with: anAdornmentAttribute [
	"Create and return a segment piece with adornment"
	<return: #BrTextEditorLineSegmentPiece>

	^ BrTextEditorLineSegmentAdornmentPiece new
		text: aText;
		adornmentAttribute: anAdornmentAttribute
]

{ #category : #'private - pieces computation' }
BrTextEditorLineSegmentSplitter >> itemValueType: anObject [
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

{ #category : #'private - pieces computation' }
BrTextEditorLineSegmentSplitter >> processAdornmentAttribute: anAdornmentAttribute of: aText in: aStream [
	aStream nextPut: (self adornmentPiece: aText with: anAdornmentAttribute)
]

{ #category : #'private - pieces computation' }
BrTextEditorLineSegmentSplitter >> processPureWords: aTextIterator in: aStream [
	"Process a text within a scope of the given iterator as if it does not contain any adornment attributes
	nor event handling attributes. At this point we should just split it in words based on the text separator
	such as space or some other characters abnd create a text piece for each `word`"
	| aWord |
	
	aWord := aTextIterator nextSegment: [ :aCharacter | self itemValueType: aCharacter ].
	aStream nextPut: (self textPiece: aWord)
]

{ #category : #'private - pieces computation' }
BrTextEditorLineSegmentSplitter >> processSegment: aTextIterator in: aStream [
	
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
BrTextEditorLineSegmentSplitter >> processWithReplacements: aTextIterator in: aStream [
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
BrTextEditorLineSegmentSplitter >> processWithoutAdornments: aTextIterator in: aStream [
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
BrTextEditorLineSegmentSplitter >> processWithoutReplacements: aTextIterator in: aStream [
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

{ #category : #splitting }
BrTextEditorLineSegmentSplitter >> split: aText [
	| thePieces |
	thePieces := Array streamContents: [ :aStream |
		| lineIterator |

		lineIterator := aText iterator.
		[ lineIterator hasNext ] whileTrue: [
			self processSegment: lineIterator in: aStream ] ].

	thePieces := thePieces
		ifEmpty:[ { self textPiece: (aText from: 0 to: 0) } ]
		ifNotEmpty: #yourself.

	^ thePieces
]

{ #category : #'instance creation' }
BrTextEditorLineSegmentSplitter >> textPiece: aText [
	"Create and return a text segment piece"
	<return: #BrTextEditorLineSegmentPiece>

	^ BrTextEditorLineSegmentTextPiece new text: aText
]
