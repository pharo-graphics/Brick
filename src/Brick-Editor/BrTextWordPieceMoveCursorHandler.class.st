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
			| aFocusFinder aDirection |
			aFocusFinder := BlFocusFinder new.
			aDirection := anEvent isUp
				ifTrue: [ BlFocusSearchDirectionUp new ]
				ifFalse: [ BlFocusSearchDirectionDown new ].
			(aFocusFinder
				nextFocus: aCursorElement
				within: anEvent editorElement
				along: aDirection)
			ifNotNil: [ :aReceiverElement |
				(aReceiverElement isKindOf: aTextElement class)
					ifTrue: [
						| aCursorBoundsInEditor aCursorBoundsInTheOtherText aLocalTextPosition aGlobalTextPosition |
				
						aCursorBoundsInEditor := (aCursorElement bounds inParent: anEvent editorElement) bounds copy.
						aCursorBoundsInTheOtherText := aReceiverElement globalBoundsToMine: aCursorBoundsInEditor fromParent: anEvent editorElement.
						
						aLocalTextPosition := aReceiverElement paragraph indexAtPosition: aCursorBoundsInTheOtherText center x @ 0.
						aGlobalTextPosition := aReceiverElement text textOffset + aLocalTextPosition.

						anEvent editorElement editor navigator
							move: anEvent cursor to: aGlobalTextPosition;
							apply ] ] ]
		ifNone: [ ]
]
