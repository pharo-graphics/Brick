Class {
	#name : #BrTextWordPieceTextChangeHandler,
	#superclass : #BrTextWordPieceUniqueHandler,
	#category : #'Brick-Editor-UI - Word'
}

{ #category : #accessing }
BrTextWordPieceTextChangeHandler >> eventClass [
	^ BrTextEditorTextChangedRequest
]

{ #category : #'api - event managing' }
BrTextWordPieceTextChangeHandler >> handleEvent: anEvent [
	anEvent currentTarget segmentPiece: anEvent segmentPiece
]
