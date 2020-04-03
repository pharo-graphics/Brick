Class {
	#name : #BrTextEmbellishmentAttribute,
	#superclass : #BrTextAdornmentAttribute,
	#instVars : [
		'embellishment',
		'padding',
		'margin'
	],
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #accessing }
BrTextEmbellishmentAttribute >> doAffect: aTBrTextEditorTextualPiece in: anEditorElement [
	"Return an element that should affect (either append or replace) a provided text piece"
	<return: #SequenceableCollection of: #BlElement>
	| aReplacementTextElement |

	aReplacementTextElement := (anEditorElement editor segmentBuilder wordStencilBuilder
		wordPadding: padding + aTBrTextEditorTextualPiece wordPadding;
		wordMargin: margin + aTBrTextEditorTextualPiece wordMargin;
		shouldUsePool: false;
		segmentPiece: aTBrTextEditorTextualPiece) asElement.

	embellishment cull: aReplacementTextElement cull: aTBrTextEditorTextualPiece.
	
	^ {
		aReplacementTextElement.
		BlElement new size: 0@0
	}
]

{ #category : #'api - attribute' }
BrTextEmbellishmentAttribute >> embellishment [
	^ embellishment
]

{ #category : #'api - attribute' }
BrTextEmbellishmentAttribute >> embellishment: anObject [
	embellishment := anObject
]

{ #category : #initialization }
BrTextEmbellishmentAttribute >> initialize [
	super initialize.
	
	embellishment := [ :aTextPieceElement :aTBrTextEditorTextualPiece | ].
	padding := BlInsets empty.
	margin := BlInsets empty
]

{ #category : #accessing }
BrTextEmbellishmentAttribute >> margin [
	^ margin
]

{ #category : #accessing }
BrTextEmbellishmentAttribute >> margin: anObject [
	margin := anObject
]

{ #category : #'api - attribute' }
BrTextEmbellishmentAttribute >> padding [
	<return: #BlInsets>

	^ padding
]

{ #category : #'api - attribute' }
BrTextEmbellishmentAttribute >> padding: anObject [
	padding := anObject
]

{ #category : #'api - attribute' }
BrTextEmbellishmentAttribute >> roundedBackground: aPaint [
	self embellishment: [ :anElement |
		anElement background: aPaint.
		anElement geometry: (BlRectangle cornerRadius: 4) ].
	self padding: (BlInsets all: 3).
	self margin: (BlInsets top: 3 bottom: 3)
]
