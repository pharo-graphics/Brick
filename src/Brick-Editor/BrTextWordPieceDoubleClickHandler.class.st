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
	| aScreenPosition aGlobalTextIndex aSelecter anEditorElement |
	
	"To not create an instance of me for each tiny text element"
	anEditorElement := anEvent currentTarget
		allParentsDetect: [ :anElement | anElement isKindOf: BrEditorElement ]
		ifFound: #yourself
		ifNone: [ ^ self ].
		
	aScreenPosition := (anEditorElement localBoundsToMine: (BlBounds origin: anEvent localPosition extent: 0@0) fromChild: anEvent currentTarget) center.

	aGlobalTextIndex := anEditorElement editor navigator
		findTextIndexAtScreenPosition: aScreenPosition
		ifAbsent: [ ^ self ].
	
	aSelecter := anEditorElement editor selecter.

	anEvent modifiers isPrimaryModifier
		ifTrue: [ aSelecter withoutCursorUpdate ].

	aSelecter
		wordAt: aGlobalTextIndex;
		select
]
