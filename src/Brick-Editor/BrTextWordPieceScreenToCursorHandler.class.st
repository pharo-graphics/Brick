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
		
	aLocalPosition := (anEvent currentTarget globalBoundsToMine: (BlBounds origin: aTransformation screenPosition extent: 0.0@0.0) fromParent: anEvent editorElement) center.
	
	aLocalTextIndex := anEvent currentTarget indexAtScreenPosition: aLocalPosition.
	aGobaltextIndex := self localTextIndexToGlobal: aLocalTextIndex in: anEvent currentTarget.
	aTransformation transformed: aGobaltextIndex
]

{ #category : #'api - event managing' }
BrTextWordPieceScreenToCursorHandler >> handleEvent: anEvent [
	| aTextElement |
	aTextElement := anEvent currentTarget.
	"If text element has no paragraph we can not find text index for mouse event"
	aTextElement rawParagraph
		ifNil: [ ^ self ].
	anEvent transformation evaluateOn: self for: anEvent
]

{ #category : #geometry }
BrTextWordPieceScreenToCursorHandler >> relativeScreenToCursor: aTransformation for: anEvent [
	"I do the hard work of finding a text element above or below a cursor that should be moved up or down and transfer cursor inside of it
	based on the current location of the cursor or on desired coordinate within the text editor"
	| aCursor aTextElement aLocalTextPositionOfThisCursor aLocalositionOfThisCursor aScreenPositionOfThisCursor aDesiredBounds aFocusFinder aDirection |

	aTextElement := anEvent currentTarget.
	aCursor := aTransformation cursor.
	
	aLocalTextPositionOfThisCursor := aCursor position - aTextElement segmentPiece textStart.
	aLocalositionOfThisCursor := aTextElement screenPositionAt: aLocalTextPositionOfThisCursor.

	aDesiredBounds := anEvent editorElement localBoundsToMine: (BlBounds origin: aLocalositionOfThisCursor extent: 0.0@0.0) fromChild: aTextElement.
	aScreenPositionOfThisCursor := aDesiredBounds center.
	
	aCursor hasDesiredCoordinate
		ifTrue: [ aDesiredBounds translateX: (aCursor desiredCoordinate - aScreenPositionOfThisCursor x) Y: 0 ]
		ifFalse: [ aCursor desiredCoordinate: aScreenPositionOfThisCursor x ].

	aDirection := aTransformation isUp
		ifTrue: [ BlFocusSearchDirectionUp new ]
		ifFalse: [ BlFocusSearchDirectionDown new ].

	aFocusFinder := BlFocusFinder new.
	(aFocusFinder
		root: anEvent editorElement;
		referenceArea: aDesiredBounds;
		direction: aDirection)
			nextFocusDo: [ :aReceiverElement |
				(aReceiverElement isKindOf: aTextElement class)
					ifTrue: [
						| aCursorBoundsInEditor aCursorBoundsInTheOtherText aLocalTextPosition aGlobalTextPosition aDesiredCoordinate |

						aCursorBoundsInEditor := aDesiredBounds copy.
						aCursorBoundsInTheOtherText := aReceiverElement globalBoundsToMine: aCursorBoundsInEditor fromParent: anEvent editorElement.

						aDesiredCoordinate := aCursorBoundsInTheOtherText center x.

						aLocalTextPosition := aReceiverElement indexAtScreenPosition: (aDesiredCoordinate @ 0) + aReceiverElement padding topLeft .
						aGlobalTextPosition := self localTextIndexToGlobal: aLocalTextPosition in: aReceiverElement.

						aTransformation transformed: aGlobalTextPosition ] ]
]
