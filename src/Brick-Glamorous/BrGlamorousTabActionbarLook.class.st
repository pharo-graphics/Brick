Class {
	#name : #BrGlamorousTabActionbarLook,
	#superclass : #BrLook,
	#instVars : [
		'actionbarContainer'
	],
	#category : #'Brick-Glamorous-Tabs - Support'
}

{ #category : #initialization }
BrGlamorousTabActionbarLook >> initialize [
	super initialize.

	actionbarContainer := BlElement new.
	actionbarContainer layout: BlLinearLayout horizontal.
	actionbarContainer constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent ].

	self addChangeAddChildAs: #(content actionbar) with: [ actionbarContainer ]
]

{ #category : #initialization }
BrGlamorousTabActionbarLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrTabActionbarChangedEvent do: [ :anEvent | self updateActionbar: anEvent stencil ]
]

{ #category : #initialization }
BrGlamorousTabActionbarLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrTabActionbarRequest new
]

{ #category : #private }
BrGlamorousTabActionbarLook >> updateActionbar: aStencil [
	actionbarContainer removeChildren.
	aStencil
		ifNotNil: [ actionbarContainer addChild: aStencil asElement ]
]
