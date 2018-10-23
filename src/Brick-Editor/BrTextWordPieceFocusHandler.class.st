Class {
	#name : #BrTextWordPieceFocusHandler,
	#superclass : #BrTextWordPieceUniqueHandler,
	#category : #'Brick-Editor-UI - Word'
}

{ #category : #accessing }
BrTextWordPieceFocusHandler >> eventClass [
	^ BrTextEditorFocusRequest
]

{ #category : #'api - event managing' }
BrTextWordPieceFocusHandler >> handleEvent: anEvent [
	anEvent currentTarget showCursors
]
