Class {
	#name : #BrTextWordPieceScreenToCursorHandler,
	#superclass : #BrTextWordPieceUniqueHandler,
	#category : #'Brick-Editor-UI - Word'
}

{ #category : #accessing }
BrTextWordPieceScreenToCursorHandler >> eventClass [
	^ BrTextEditorScreenToCursorRequest
]

{ #category : #'as yet unclassified' }
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
