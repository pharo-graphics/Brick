Class {
	#name : #BrGlamorousTabActionbarAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'actionbarContainer'
	],
	#category : #'Brick-Glamorous-Tabs - Support'
}

{ #category : #initialization }
BrGlamorousTabActionbarAptitude >> initialize [
	super initialize.

	actionbarContainer := BlElement new.
	actionbarContainer layout: BlLinearLayout horizontal.
	actionbarContainer constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent ].

	self addChangeAddChildAs: #(content actionbar) with: [ actionbarContainer ]
]

{ #category : #initialization }
BrGlamorousTabActionbarAptitude >> initializeListeners [
	super initializeListeners.
	
	self when: BrTabActionbarChangedEvent do: [ :anEvent | self updateActionbar: anEvent stencil tab: anEvent tab ]
]

{ #category : #initialization }
BrGlamorousTabActionbarAptitude >> initializeRequests [
	super initializeRequests.
	
	self request: BrTabActionbarRequest new
]

{ #category : #private }
BrGlamorousTabActionbarAptitude >> updateActionbar: aStencil tab: aBrTabModel [
	actionbarContainer removeChildren.
	aStencil
		ifNotNil: [
			| anActionbarElement |
			
			anActionbarElement := aStencil
				tabModel: aBrTabModel;
				asElement.
			aStencil tabModel: nil.

			actionbarContainer addChild: anActionbarElement ]
]
