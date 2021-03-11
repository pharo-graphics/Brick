Class {
	#name : #BrTextEditorDoubleClickHandler,
	#superclass : #BlCustomEventHandler,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Brick-Editor-UI - Handlers'
}

{ #category : #accessing }
BrTextEditorDoubleClickHandler class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : #accessing }
BrTextEditorDoubleClickHandler class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #'api - event managing' }
BrTextEditorDoubleClickHandler >> doubleClickEvent: anEvent [
	| aScreenPosition aGlobalTextIndex aSelecter anEditorElement |
	
	"To not create an instance of me for each tiny text element"
	anEditorElement := anEvent currentTarget
		withAllParentsDetect: [ :anElement | anElement isKindOf: BrEditorElement ]
		ifFound: #yourself
		ifNone: [ ^ self ].
		
	aScreenPosition := (anEditorElement localBoundsToMine: (BlBounds origin: anEvent localPosition extent: 0.0@0.0) fromChild: anEvent currentTarget) center.

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

{ #category : #accessing }
BrTextEditorDoubleClickHandler >> eventsToHandle [
	^ { BlDoubleClickEvent }
]

{ #category : #accessing }
BrTextEditorDoubleClickHandler >> wantsEvent: anEvent [
	^ (super wantsEvent: anEvent) and: [ anEvent primaryButtonPressed ]
]
