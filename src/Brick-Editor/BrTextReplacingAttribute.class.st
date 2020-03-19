Class {
	#name : #BrTextReplacingAttribute,
	#superclass : #BrTextAdornmentAttribute,
	#instVars : [
		'replacement',
		'embellishment',
		'padding',
		'margin',
		'originalString',
		'replacementString'
	],
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #accessing }
BrTextReplacingAttribute >> doAffect: aTBrTextEditorTextualPiece in: anEditorElement [
	"Return an element that should affect (either append or replace) a provided text piece"
	<return: #SequenceableCollection of: #BlElement>
	| aReplacementTextElement |

	aReplacementTextElement := (anEditorElement editor segmentBuilder wordStencilBuilder
		wordPadding: padding + aTBrTextEditorTextualPiece wordPadding;
		wordMargin: margin + aTBrTextEditorTextualPiece wordMargin;
		shouldUsePool: false;
		segmentPiece: (self replaceTextInPiece: aTBrTextEditorTextualPiece)) asElement.

	aReplacementTextElement removeEventHandler: BrTextWordPieceTextChangeHandler uniqueInstance.
	aReplacementTextElement when: BrTextEditorTextChangedRequest do: [ :anEvent |
		| aHiddenSegmentPiece |
		aHiddenSegmentPiece := self replaceTextInPiece: anEvent segmentPiece.
		anEvent currentTarget segmentPiece: aHiddenSegmentPiece
	].

	embellishment cull: aReplacementTextElement cull: aTBrTextEditorTextualPiece.
	
	^ {
		aReplacementTextElement.
		BlElement new size: 0@0
	}
]

{ #category : #'api - attribute' }
BrTextReplacingAttribute >> embellishment [
	^ embellishment
]

{ #category : #'api - attribute' }
BrTextReplacingAttribute >> embellishment: anObject [
	embellishment := anObject
]

{ #category : #'api - attribute' }
BrTextReplacingAttribute >> glamorousRoundedBackground [
	self embellishment: [ :anElement |
		anElement background: BrGlamorousColors neutralBackgroundColor.
		anElement geometry: (BlRectangle cornerRadius: 4) ].
	self padding: (BlInsets all: 3).
	self margin: (BlInsets top: 3 bottom: 3)
]

{ #category : #initialization }
BrTextReplacingAttribute >> initialize [
	super initialize.
	
	replacement := BrTextReplacingAttributeWithCharacterStrategy new character: $*.
	embellishment := [ :aTextPieceElement :aTBrTextEditorTextualPiece | ].
	padding := BlInsets empty.
	margin := BlInsets empty
]

{ #category : #accessing }
BrTextReplacingAttribute >> margin [
	^ margin
]

{ #category : #accessing }
BrTextReplacingAttribute >> margin: anObject [
	margin := anObject
]

{ #category : #'api - attribute' }
BrTextReplacingAttribute >> padding [
	<return: #BlInsets>

	^ padding
]

{ #category : #'api - attribute' }
BrTextReplacingAttribute >> padding: anObject [
	padding := anObject
]

{ #category : #private }
BrTextReplacingAttribute >> replaceTextInPiece: aTBrTextEditorTextualPiece [
	| aNewText anOriginalText |
	
	anOriginalText := aTBrTextEditorTextualPiece text.
	aNewText := (self swapString: anOriginalText characters asString) asRopedText.
	
	self
		assert: [ anOriginalText size = aNewText size ]
		description: [ 'Replacement text must be the same size' ].
	
	anOriginalText
		attributesDo: [ :theAttributes :anIndex | aNewText attributes: theAttributes from: anIndex to: anIndex ].

	^ aTBrTextEditorTextualPiece copyWithText: aNewText
]

{ #category : #accessing }
BrTextReplacingAttribute >> replacement [
	<return: #BrTextReplacingAttributeStrategy>

	^ replacement
]

{ #category : #accessing }
BrTextReplacingAttribute >> replacement: aBrTextReplacingAttributeStrategy [
	replacement := aBrTextReplacingAttributeStrategy
]

{ #category : #private }
BrTextReplacingAttribute >> swapString: aString [
	<return: #String>
	
	(originalString = aString and: [ replacementString isNotNil ])
		ifTrue: [ ^ replacementString ].
		
	originalString := aString.
	replacementString := replacement swapString: aString.
	
	^ replacementString
]

{ #category : #'api - attribute' }
BrTextReplacingAttribute >> withCharacter: aCharacter [
	self replacement: (BrTextReplacingAttributeWithCharacterStrategy new character: aCharacter)
]

{ #category : #'api - attribute' }
BrTextReplacingAttribute >> withRandomizing [
	self replacement: (BrTextReplacingAttributeWithRandomizingStrategy new)
]
