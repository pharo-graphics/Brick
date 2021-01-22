Class {
	#name : #BrTextAdornmentAttributeTaskItRenderingStrategy,
	#superclass : #BrTextAdornmentAttributeRenderingStrategy,
	#category : #'Brick-Editor-Attributes - Support'
}

{ #category : #accessing }
BrTextAdornmentAttributeTaskItRenderingStrategy >> affect: aTBrTextEditorTextualPiece in: anEditorElement [
	"Return an element that should affect (either append or replace) a provided text piece"
	<return: #BlElement>

	^ BlLazyElement new
		withGlamorousPreview;
		in: [ :theElement | self attribute initializeLazyElement: theElement ];
		elementBuilder: [ self attribute doAffect: aTBrTextEditorTextualPiece in: anEditorElement ]
]
