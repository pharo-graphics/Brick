Class {
	#name : #BrTextWordPieceDoubleClickHandler,
	#superclass : #BrTextWordPieceUniqueHandler,
	#category : #'Brick-Editor-UI - Word'
}

{ #category : #accessing }
BrTextWordPieceDoubleClickHandler >> eventClass [
	^ BlDoubleClickEvent
]

{ #category : #'api - event managing' }
BrTextWordPieceDoubleClickHandler >> handleEvent: anEvent [
	| aLocalTextIndex aGobaltextIndex aSelecter anEditorElement |
	
	"To not create an instance of me for each tiny text element"
	anEditorElement := anEvent currentTarget
		allParentsDetect: [ :anElement | anElement isKindOf: BrEditorElement ]
		ifFound: #yourself
		ifNone: [ ^ self ].
	
	aLocalTextIndex := anEvent currentTarget paragraph indexAtPosition: anEvent localPosition.
	aGobaltextIndex := (anEvent currentTarget text start + aLocalTextIndex - 1) max: 0.
	
	aSelecter := anEditorElement editor selecter.

	anEvent modifiers isPrimaryModifier
		ifTrue: [ aSelecter withoutCursorUpdate ].

	aSelecter
		wordAt: aGobaltextIndex;
		select
]
