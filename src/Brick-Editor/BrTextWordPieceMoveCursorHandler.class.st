Class {
	#name : #BrTextWordPieceMoveCursorHandler,
	#superclass : #BrTextWordPieceUniqueHandler,
	#category : #'Brick-Editor-UI - Word'
}

{ #category : #accessing }
BrTextWordPieceMoveCursorHandler >> eventClass [
	^ BrTextEditorMoveCursorRequest
]

{ #category : #'api - event managing' }
BrTextWordPieceMoveCursorHandler >> handleEvent: anEvent [
	| aTextElement |
	
	aTextElement := anEvent currentTarget.
	
	aTextElement cursorAt: anEvent cursorPosition
		ifFound: [ :aCursorElement |
			
		]
		ifNone: [ ]
	
]
