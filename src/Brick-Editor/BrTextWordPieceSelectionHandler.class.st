Class {
	#name : #BrTextWordPieceSelectionHandler,
	#superclass : #BrTextWordPieceUniqueHandler,
	#category : #'Brick-Editor-UI - Word'
}

{ #category : #accessing }
BrTextWordPieceSelectionHandler >> eventClass [
	^ BrTextEditorSelectRequest
]

{ #category : #'api - event managing' }
BrTextWordPieceSelectionHandler >> handleEvent: anEvent [
	anEvent currentTarget select: anEvent fromIndex to: anEvent toIndex
]
