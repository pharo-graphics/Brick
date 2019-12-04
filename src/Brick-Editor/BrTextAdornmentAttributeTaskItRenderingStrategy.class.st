Class {
	#name : #BrTextAdornmentAttributeTaskItRenderingStrategy,
	#superclass : #BrTextAdornmentAttributeRenderingStrategy,
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #accessing }
BrTextAdornmentAttributeTaskItRenderingStrategy >> affect: aBrText in: anEditorElement [
	"Return an element that should affect (either append or replace) a provided text piece"
	<return: #BlElement>
	^ BlLazyElement 
		ifEnabledInstanceDo: [ :theLazyElement | 
			self attribute initializeLazyElement: theLazyElement ]
		elementBuilder: [ self attribute doAffect: aBrText in: anEditorElement ]
]
