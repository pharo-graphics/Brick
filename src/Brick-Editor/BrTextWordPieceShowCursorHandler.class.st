Class {
	#name : #BrTextWordPieceShowCursorHandler,
	#superclass : #BrTextWordPieceUniqueHandler,
	#category : #'Brick-Editor-UI - Word'
}

{ #category : #accessing }
BrTextWordPieceShowCursorHandler >> eventClass [
	^ BrTextEditorShowCursorRequest
]

{ #category : #'api - event managing' }
BrTextWordPieceShowCursorHandler >> handleEvent: anEvent [
	| aCursorElement |

	aCursorElement := anEvent currentTarget addCursorAt: anEvent cursorPosition.
	anEvent editorElement dispatchEvent: (BrTextEditorCursorElementAddedEvent new cursorElement: aCursorElement).

	anEvent hasFocus
		ifTrue: [ anEvent currentTarget showCursors ]
		ifFalse: [ anEvent currentTarget hideCursors ]
]
