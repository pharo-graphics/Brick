Class {
	#name : #BrTextAdornmentAttributeSyncRenderingStrategy,
	#superclass : #BrTextAdornmentAttributeRenderingStrategy,
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #accessing }
BrTextAdornmentAttributeSyncRenderingStrategy >> affect: aTBrTextEditorTextualPiece in: anEditorElement [
	"Return an element that should affect (either append or replace) a provided text piece"
	<return: #BlElement>
	^ self attribute doAffect: aTBrTextEditorTextualPiece in: anEditorElement
]
