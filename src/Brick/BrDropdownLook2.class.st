Class {
	#name : #BrDropdownLook2,
	#superclass : #BrAnchoredWithHandleAndContentLook,
	#instVars : [
		'clickEventHandler'
	],
	#category : #'Brick-Dropdown - Look'
}

{ #category : #accessing }
BrDropdownLook2 >> handle: anElement [
	handle removeEventFilter: clickEventHandler.
	super handle: anElement.
	handle addEventFilter: clickEventHandler
]

{ #category : #initialization }
BrDropdownLook2 >> initialize [
	super initialize.
	clickEventHandler := BlEventHandler
		on: BlClickEvent
		do: [ :e | 
			withAnchoredLook canHide
				ifTrue: [ withAnchoredLook hide ] ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | handle addEventFilter: clickEventHandler ];
				down: [ :e | handle removeEventFilter: clickEventHandler ];
				yourself)
]

{ #category : #initialization }
BrDropdownLook2 >> initializeListeners [
	super initializeListeners.

	self when: BrDropdownHandleChanged do: [ :anEvent | self handle: anEvent handle ].
	self when: BrDropdownContentChanged do: [ :anEvent | self content: anEvent content ]
]

{ #category : #initialization }
BrDropdownLook2 >> initializeRequests [
	super initializeRequests.

	self request: BrDropdownHandleRequest new.
	self request: BrDropdownContentRequest new
]
