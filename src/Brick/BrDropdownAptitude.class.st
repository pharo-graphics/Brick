Class {
	#name : #BrDropdownAptitude,
	#superclass : #BrAnchoredWithHandleAndContentAptitude,
	#instVars : [
		'clickEventHandler'
	],
	#category : #'Brick-Dropdown - Look'
}

{ #category : #accessing }
BrDropdownAptitude >> handle: anElement [
	handle removeEventFilter: clickEventHandler.
	super handle: anElement.
	handle addEventFilter: clickEventHandler
]

{ #category : #initialization }
BrDropdownAptitude >> initialize [
	super initialize.

	clickEventHandler := BlEventHandler
		on: BlClickEvent
		do: [ :anEvent |
			anEvent consumed: true.
			anEvent currentTarget fireEvent: BrDropdownHideWish new ].

	self
		addChange:
			(BrLookChange new
				up: [ :e |
					(handle hasEventFilter: clickEventHandler)
						ifFalse: [ handle addEventFilter: clickEventHandler ] ];
				down: [ :e | handle removeEventFilter: clickEventHandler ];
				yourself)
]

{ #category : #initialization }
BrDropdownAptitude >> initializeListeners [
	super initializeListeners.

	self when: BrDropdownHandleChanged do: [ :anEvent | self handle: anEvent handle ].
	self when: BrDropdownContentChanged do: [ :anEvent | self content: anEvent content ]
]

{ #category : #initialization }
BrDropdownAptitude >> initializeRequests [
	super initializeRequests.

	self request: BrDropdownHandleRequest new.
	self request: BrDropdownContentRequest new
]
