Class {
	#name : #BrDropdownLook2,
	#superclass : #BrAnchoredWithHandleAndContentLook,
	#instVars : [
		'clickEventHandler'
	],
	#category : #'Brick-Dropdown - Look'
}

{ #category : #'as yet unclassified' }
BrDropdownLook2 >> contentChangedClass [
	^ BrDropdownContentChanged
]

{ #category : #'as yet unclassified' }
BrDropdownLook2 >> contentRequest [
	^ BrDropdownContentRequest new
]

{ #category : #accessing }
BrDropdownLook2 >> handle: anElement [
	handle removeEventFilter: clickEventHandler.
	super handle: anElement.
	handle addEventFilter: clickEventHandler
]

{ #category : #'as yet unclassified' }
BrDropdownLook2 >> handleChangedClass [
	^ BrDropdownHandleChanged
]

{ #category : #'as yet unclassified' }
BrDropdownLook2 >> handleRequest [
	^ BrDropdownHandleRequest new
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
