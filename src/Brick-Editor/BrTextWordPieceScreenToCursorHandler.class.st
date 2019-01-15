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
	| aLocalTextIndex aGobaltextIndex |
	
	aLocalTextIndex := anEvent currentTarget paragraph indexAtPosition: anEvent localPosition.
	aGobaltextIndex := (anEvent currentTarget text start + aLocalTextIndex - 1) max: 0.
	
	aTransformation transformed: aGobaltextIndex
]

{ #category : #'api - event managing' }
BrTextWordPieceScreenToCursorHandler >> handleEvent: anEvent [
	anEvent transformation evaluateOn: self for: anEvent
]
