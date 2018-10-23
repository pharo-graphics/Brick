Class {
	#name : #BrTextWordPieceBlurHandler,
	#superclass : #BrTextWordPieceUniqueHandler,
	#category : #'Brick-Editor-UI - Word'
}

{ #category : #'api - event managing' }
BrTextWordPieceBlurHandler >> eventClass [
	^ BrTextEditorBlurRequest
]

{ #category : #'api - event managing' }
BrTextWordPieceBlurHandler >> handleEvent: anEvent [
	anEvent currentTarget hideCursors
]
