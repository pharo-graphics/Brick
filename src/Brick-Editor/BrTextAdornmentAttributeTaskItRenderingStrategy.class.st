Class {
	#name : #BrTextAdornmentAttributeTaskItRenderingStrategy,
	#superclass : #BrTextAdornmentAttributeRenderingStrategy,
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #accessing }
BrTextAdornmentAttributeTaskItRenderingStrategy >> affect: aBrText in: anEditorElement [
	"Return an element that should affect (either append or replace) a provided text piece"
	<return: #BlElement>
	^ BlLazyElement new
		in: [ :theElement | self attribute initializeLazyElement: theElement ];
		elementBuilder: [ self attribute doAffect: aBrText in: anEditorElement ]
]
