Class {
	#name : #BrTextClickAttribute,
	#superclass : #BrTextEventHandlerAttribute,
	#category : 'Brick-Editor-Text-Attributes'
}

{ #category : #'mouse handlers' }
BrTextClickAttribute >> clickEvent: anEvent [
	self performAction: anEvent
]

{ #category : #events }
BrTextClickAttribute >> wantsEvent: anEvent [
	^ anEvent isKindOf: BlClickEvent
]
