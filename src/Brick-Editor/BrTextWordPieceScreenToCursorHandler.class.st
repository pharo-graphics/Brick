Class {
	#name : #BrTextWordPieceScreenToCursorHandler,
	#superclass : #BrTextWordPieceUniqueHandler,
	#category : #'Brick-Editor-UI - Word'
}

{ #category : #accessing }
BrTextWordPieceScreenToCursorHandler >> eventClass [
	^ BrTextEditorScreenToCursorRequest
]

{ #category : #geometry }
BrTextWordPieceScreenToCursorHandler >> explicitScreenToCursor: aTransformation for: anEvent [
	| aLocalPosition aLocalTextIndex aGobaltextIndex |
	
	aLocalPosition := (anEvent currentTarget globalBoundsToMine: (BlBounds origin: aTransformation screenPosition extent: 0@0) fromParent: anEvent editorElement) center.
	
	aLocalTextIndex := anEvent currentTarget paragraph indexAtPosition: aLocalPosition.
	aGobaltextIndex := (anEvent currentTarget text start + aLocalTextIndex - 1) max: 0.
	
	aTransformation transformed: aGobaltextIndex
]

{ #category : #'api - event managing' }
BrTextWordPieceScreenToCursorHandler >> handleEvent: anEvent [
	anEvent transformation evaluateOn: self for: anEvent
]

{ #category : #geometry }
BrTextWordPieceScreenToCursorHandler >> relativeScreenToCursor: aTransformation for: anEvent [
	"I do the hard work of finding a text element above or below a cursor that should be moved up or down and transfer cursor inside of it
	based on the current location of the cursor or on desired coordinate within the text editor"
	| aCursor aTextElement aLocalTextPositionOfThisCursor aLocalositionOfThisCursor aScreenPositionOfThisCursor aDesiredBounds aFocusFinder aDirection |

	aTextElement := anEvent currentTarget.
	aCursor := aTransformation cursor.

	aLocalTextPositionOfThisCursor := aCursor position - aTextElement text textOffset.
	aLocalositionOfThisCursor := aTextElement cursorScreenPositionAt: aLocalTextPositionOfThisCursor.

	aDesiredBounds := anEvent editorElement localBoundsToMine: (BlBounds origin: aLocalositionOfThisCursor extent: 0@0) fromChild: aTextElement.
	aScreenPositionOfThisCursor := aDesiredBounds center.

	aCursor hasDesiredCoordinate
		ifTrue: [ aDesiredBounds translateX: (aCursor desiredCoordinate - aScreenPositionOfThisCursor x) Y: 0 ]
		ifFalse: [ aCursor desiredCoordinate: aScreenPositionOfThisCursor x ].

	aDirection := aTransformation isUp
		ifTrue: [ BlFocusSearchDirectionUp new ]
		ifFalse: [ BlFocusSearchDirectionDown new ].

	aFocusFinder := BlFocusFinder new.
	(aFocusFinder
		nextFocus: nil
		within: anEvent editorElement
		from: aDesiredBounds
		along: aDirection)
			ifNotNil: [ :aReceiverElement |
				(aReceiverElement isKindOf: aTextElement class)
					ifTrue: [
						| aCursorBoundsInEditor aCursorBoundsInTheOtherText aLocalTextPosition aGlobalTextPosition aDesiredCoordinate |

						aCursorBoundsInEditor := aDesiredBounds copy.
						aCursorBoundsInTheOtherText := aReceiverElement globalBoundsToMine: aCursorBoundsInEditor fromParent: anEvent editorElement.

						aDesiredCoordinate := aCursorBoundsInTheOtherText center x.

						aLocalTextPosition := aReceiverElement paragraph indexAtPosition: aDesiredCoordinate @ 0.
						aGlobalTextPosition := aReceiverElement text textOffset + aLocalTextPosition.

						aTransformation transformed: aGlobalTextPosition ] ]
]
