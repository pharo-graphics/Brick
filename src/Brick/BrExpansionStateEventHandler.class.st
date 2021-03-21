Class {
	#name : #BrExpansionStateEventHandler,
	#superclass : #BlElementStateEventHandler,
	#category : #'Brick-! Core - Expansion'
}

{ #category : #private }
BrExpansionStateEventHandler >> element: anElement expanded: aBoolean [
	aBoolean
		ifTrue: [ anElement states addState: BlElementState expanded ]
		ifFalse: [ anElement states addState: BlElementState collapsed ]
]

{ #category : #'api - accessing' }
BrExpansionStateEventHandler >> eventsToHandle [
	^ {
		BrExpansionToggleWish.
	}
]

{ #category : #'focus handlers' }
BrExpansionStateEventHandler >> handleEvent: aBrExpansionToggleWish [
	| anElement |
	
	aBrExpansionToggleWish consumed: true.
	
	anElement := aBrExpansionToggleWish currentTarget.
	self
		element: anElement
		expanded: (anElement states hasState: BlElementState expanded) not
]
