Class {
	#name : #BrTextWordPieceHideCursorHandler,
	#superclass : #BrTextWordPieceUniqueHandler,
	#category : #'Brick-Editor-UI - Word'
}

{ #category : #accessing }
BrTextWordPieceHideCursorHandler >> eventClass [
	^ BrTextEditorHideCursorRequest
]

{ #category : #'api - event managing' }
BrTextWordPieceHideCursorHandler >> handleEvent: anEvent [
	| aTextElement aCursorElement |
	
	aTextElement := anEvent currentTarget.
	
	(aTextElement hasCursorAt: anEvent cursorPosition)
		ifFalse: [ ^ self ].

	aCursorElement := aTextElement removeCursorAt: anEvent cursorPosition.
	anEvent editorElement dispatchEvent: (BrTextEditorCursorElementRemovedEvent new cursorElement: aCursorElement)
]
