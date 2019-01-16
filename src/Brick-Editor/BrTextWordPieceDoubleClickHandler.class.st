Class {
	#name : #BrTextWordPieceDoubleClickHandler,
	#superclass : #BrTextWordPieceStatefulHandler,
	#category : #'Brick-Editor-UI - Word'
}

{ #category : #accessing }
BrTextWordPieceDoubleClickHandler >> eventClass [
	^ BlDoubleClickEvent
]

{ #category : #'api - event managing' }
BrTextWordPieceDoubleClickHandler >> handleEvent: anEvent [
	| aLocalTextIndex aGobaltextIndex aSelecter |
	
	aLocalTextIndex := anEvent currentTarget paragraph indexAtPosition: anEvent localPosition.
	aGobaltextIndex := (anEvent currentTarget text start + aLocalTextIndex - 1) max: 0.
	
	aSelecter := self editorElement editor selecter.

	anEvent modifiers isPrimaryModifier
		ifTrue: [ aSelecter withoutCursorUpdate ].

	aSelecter
		wordAt: aGobaltextIndex;
		select
]
