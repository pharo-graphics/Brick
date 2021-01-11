Class {
	#name : #BrTextHideAttribute,
	#superclass : #BrTextAdornmentAttribute,
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #accessing }
BrTextHideAttribute >> doAffect: aTBrTextEditorTextualPiece in: anEditorElement [
	"Return an element that should affect (either append or replace) a provided text piece"
	<return: #SequenceableCollection of: #BlElement>

	^ #()
]

{ #category : #initialization }
BrTextHideAttribute >> initialize [
	super initialize.
	
	self beReplace
]
