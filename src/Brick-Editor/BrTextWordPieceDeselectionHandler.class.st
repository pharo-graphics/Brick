Class {
	#name : #BrTextWordPieceDeselectionHandler,
	#superclass : #BrTextWordPieceHandler,
	#category : #'Brick-Editor-UI - Word'
}

{ #category : #accessing }
BrTextWordPieceDeselectionHandler >> eventClass [
	^ BrTextEditorDeselectRequest
]

{ #category : #'api - event managing' }
BrTextWordPieceDeselectionHandler >> handleEvent: anEvent [
	anEvent currentTarget selectNone
]
