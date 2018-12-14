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
	"I do the hard work of finding a text element above or below a cursor that should be moved up or down and transfer cursor inside of it
	based on the current location of the cursor or on desired coordinate within the text editor"
	| aTextElement |

	aTextElement := anEvent currentTarget.
	aTextElement cursorAt: anEvent cursorPosition
		ifFound: [ :aCursorElement |
			| aFocusFinder aDirection aCursor aDesiredBounds |

			aFocusFinder := BlFocusFinder new.
			aDirection := anEvent isUp
				ifTrue: [ BlFocusSearchDirectionUp new ]
				ifFalse: [ BlFocusSearchDirectionDown new ].

			aDesiredBounds := (aCursorElement bounds inParent: anEvent editorElement) bounds copy.
			aCursor := anEvent cursor.
			aCursor hasDesiredCoordinate
				ifTrue: [ aDesiredBounds translateX: (aCursor desiredCoordinate - aDesiredBounds center x) Y: 0 ]
				ifFalse: [ aCursor desiredCoordinate: aDesiredBounds center x ].

			(aFocusFinder
				nextFocus: nil
				within: anEvent editorElement
				from: aDesiredBounds
				along: aDirection)
			ifNotNil: [ :aReceiverElement |
				(aReceiverElement isKindOf: aTextElement class)
					ifTrue: [
						| aCursorBoundsInEditor aCursorBoundsInTheOtherText aLocalTextPosition aGlobalTextPosition aDesiredCoordinate |

						aCursorBoundsInEditor := aDesiredBounds.
						aCursorBoundsInTheOtherText := aReceiverElement globalBoundsToMine: aCursorBoundsInEditor fromParent: anEvent editorElement.

						aDesiredCoordinate := aCursorBoundsInTheOtherText center x.

						aLocalTextPosition := aReceiverElement paragraph indexAtPosition: aDesiredCoordinate @ 0.
						aGlobalTextPosition := aReceiverElement text textOffset + aLocalTextPosition.

						anEvent editorElement editor navigator
							withoutResettingDesiredCoordinate;
							move: anEvent cursor to: aGlobalTextPosition;
							apply ] ] ]
		ifNone: [ ]
]
