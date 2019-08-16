"
I split a piece of text behind a ${class:BrTextEditorLineSegment}$ into pieces
"
Class {
	#name : #BrTextEditorLineSegmentSplitter,
	#superclass : #Object,
	#category : #'Brick-Editor-Model - Segment-Text-Line'
}

{ #category : #'instance creation' }
BrTextEditorLineSegmentSplitter >> adornmentPiece: aBlText with: anAdornmentAttribute from: aTextStart to: aTextEnd [
	"Create and return a segment piece with adornment"
	<return: #BrTextEditorLineSegmentPiece>

	^ BrTextEditorLineSegmentAdornmentPiece new
		initializeWith: aBlText
		from: aTextStart
		to: aTextEnd;
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
BrTextEditorLineSegmentSplitter >> processAdornmentAttribute: anAdornmentAttribute of: aText in: aStream from: aTextStart to: aTextEnd [
	aStream nextPut: (self adornmentPiece: aText with: anAdornmentAttribute from: aTextStart to: aTextEnd)
]

{ #category : #'private - pieces computation' }
BrTextEditorLineSegmentSplitter >> processPureWords: aTextIterator in: aStream from: aStartIndex to: anEndIndex [
	"Process a text within a scope of the given iterator as if it does not contain any adornment attributes
	nor event handling attributes. At this point we should just split it in words based on the text separator
	such as space or some other characters abnd create a text piece for each `word`"
	
	aTextIterator
		nextSegment: [ :aCharacter | self itemValueType: aCharacter ]
		indicesDo: [ :aStart :anEnd |
			| aWord |			
			aWord := aTextIterator text from: ((aStart + 1) min: anEnd) to: anEnd.
			aStream nextPut: (self textPiece: aWord from: aStart + aStartIndex to: anEnd + aStartIndex) ]
]

{ #category : #'private - pieces computation' }
BrTextEditorLineSegmentSplitter >> processSegment: aTextIterator in: aStream from: aStartIndex to: anEndIndex [
	
	aTextIterator
		nextSpanAny: [ :eachAttribute | eachAttribute isAdornment and: [ eachAttribute shouldReplace ] ]
		indicesDo: [ :aStart :anEnd :hasReplacements | 
			| aSpanIterator aDelta |
			aSpanIterator := (aTextIterator text
				from: aStart
				to: anEnd) iterator.
			aDelta := (aStart - 1) max: 0.	
			[ aSpanIterator hasNext ]
				whileTrue: [
					hasReplacements
						ifTrue: [ self processWithReplacements: aSpanIterator in: aStream from: aStartIndex + aDelta to: anEndIndex + aDelta ]
						ifFalse: [ self processWithoutReplacements: aSpanIterator in: aStream from: aStartIndex + aDelta to: anEndIndex + aDelta ] ] ]
]

{ #category : #'private - pieces computation' }
BrTextEditorLineSegmentSplitter >> processWithReplacements: aTextIterator in: aStream from: aStartIndex to: anEndIndex [
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
					in: aStream
					from: ((aStart - 1) max: 0) + aStartIndex
					to: anEnd + aStartIndex ] ]
]

{ #category : #'private - pieces computation' }
BrTextEditorLineSegmentSplitter >> processWithoutAdornments: aTextIterator in: aStream from: aStartIndex to: anEndIndex [
	"Process a text within the scope of the given iterator as there are no adornment attributes.
	Now that adornment attributes are filtered we can split text into pieces based on the presence of
	event handling attributes. Every combination of event handling elements should be a separate text piece
	with its own unique visual element"

	aTextIterator
		nextSpan: [ :eachAttribute | eachAttribute isEventHandler ]
		indicesDo: [ :aStart :anEnd :theEventHandlerAttributes | 
			| aSpan aSpanIterator aDelta |
			aSpan := aTextIterator text
				from: aStart
				to: anEnd.
			aSpanIterator := aSpan iterator.
			aDelta := (aStart - 1) max: 0.
			[ aSpanIterator hasNext ] whileTrue: [
				self processPureWords: aSpanIterator in: aStream from: aStartIndex + aDelta to: anEndIndex + aDelta ] ]
]

{ #category : #'private - pieces computation' }
BrTextEditorLineSegmentSplitter >> processWithoutReplacements: aTextIterator in: aStream from: aStartIndex to: anEndIndex [
	"There are no replacement attributes within the scope of the given iterator"

	aTextIterator
		nextAttributedEnd: [ :eachAttribute | eachAttribute isAdornment and: [ eachAttribute shouldAppend ] ]
		indicesDo: [ :aStart :anEnd :theEndedAttributes |
			| aSpan aSpanIterator |
			aSpan := aTextIterator text from: aStart to: anEnd.
			aSpanIterator := aSpan iterator.
			[ aSpanIterator hasNext ] whileTrue: [
				self processWithoutAdornments: aSpanIterator in: aStream from: aStartIndex to: anEndIndex ].
			
			theEndedAttributes do: [ :eachAttribute |
				self
					processAdornmentAttribute: eachAttribute
					of: aSpan
					in: aStream
					from: ((aStart - 1) max: 0) + aStartIndex
					to: anEnd + aStartIndex ] ]
]

{ #category : #splitting }
BrTextEditorLineSegmentSplitter >> split: aText from: aStartIndex to: anEndIndex [
	| thePieces |
	thePieces := Array streamContents: [ :aStream |
		| lineIterator |
		
		lineIterator := aText iterator.
		[ lineIterator hasNext ] whileTrue: [
			self processSegment: lineIterator in: aStream from: aStartIndex to: anEndIndex ] ].

	thePieces := thePieces
		ifEmpty:[ { self textPiece: aText from: 0 to: 0 } ]
		ifNotEmpty: #yourself.

	^ thePieces
]

{ #category : #'instance creation' }
BrTextEditorLineSegmentSplitter >> textPiece: aBlText from: aTextStart to: aTextEnd [
	"Create and return a text segment piece"
	<return: #BrTextEditorLineSegmentPiece>

	^ BrTextEditorLineSegmentTextPiece new
		initializeWith: aBlText
		from: aTextStart
		to: aTextEnd
]
