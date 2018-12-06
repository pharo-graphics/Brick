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
			| aFocusFinder aDirection aReceiverElement |
			aFocusFinder := BlFocusFinder new.
			aDirection := anEvent isUp
				ifTrue: [ BlFocusSearchDirectionUp new ]
				ifFalse: [ BlFocusSearchDirectionDown new ].
			
			aReceiverElement := aFocusFinder
				nextFocus: aTextElement
				within: anEvent editorElement
				from: aCursorElement bounds inParent asRectangle
				along: aDirection.
			
			aReceiverElement logCr.
		
		]
		
		ifNone: [ ]
	
]
