Class {
	#name : #BrDropdownLook,
	#superclass : #BrAnchoredLook,
	#instVars : [
		'clickEventHandler'
	],
	#category : #'Brick-Dropdown - Look'
}

{ #category : #accessing }
BrDropdownLook >> handle: anElement [
	handle removeEventFilter: clickEventHandler.
	super handle: anElement.
	handle addEventFilter: clickEventHandler
]

{ #category : #'as yet unclassified' }
BrDropdownLook >> hideWish [
	^ BrDropdownHideWish new
]

{ #category : #initialization }
BrDropdownLook >> initialize [
	super initialize.
	clickEventHandler := BlEventHandler
		on: BlClickEvent
		do: [ :e | self hide ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | handle addEventFilter: clickEventHandler ];
				down: [ :e | handle removeEventFilter: clickEventHandler ];
				yourself)
]

{ #category : #initialization }
BrDropdownLook >> initializeListeners [
	super initializeListeners.

	self when: BrDropdownHandleChanged do: [ :anEvent | self handle: anEvent handle ].
	self when: BrDropdownContentChanged do: [ :anEvent | self content: anEvent content ].
	self when: BrDropdownRelocateWish do: [ :aWish | self onRelocateWish: aWish ]
]

{ #category : #initialization }
BrDropdownLook >> initializeRequests [
	super initializeRequests.

	self request: BrDropdownHandleRequest new.
	self request: BrDropdownContentRequest new
]

{ #category : #'as yet unclassified' }
BrDropdownLook >> relocate [
	| positioner contentMaxBounds anchorBounds scale position |
	self assert: [ self canRelocate ].
	positioner := BrAnchoredPositioner
		anchor: widget anchor
		target: widget parent.
	scale := widget anchor globalScale.
	anchorBounds := positioner anchorBoundsInTarget.
	contentMaxBounds := positioner
		maxBoundsPreferredInTarget: content size * scale.
	scrollableContent
		constraintsDo: [ :c | 
			c maxWidth: contentMaxBounds width / scale.
			c maxHeight: contentMaxBounds height /scale ].
	position := 0 @ 0.
	positioner positionPreferred = (#bottom -> #right)
		ifTrue: [ position := anchorBounds topLeft ].
	positioner positionPreferred = (#bottom -> #left)
		ifTrue: [ position := anchorBounds topRight
				- (scrollableContent width @ 0 * scale) ].
	positioner positionPreferred = (#top -> #right)
		ifTrue: [ position := anchorBounds topLeft
				- (0 @ scrollableContent height * scale) ].
	positioner positionPreferred = (#top -> #left)
		ifTrue:
			[ position := anchorBounds topRight - (scrollableContent size * scale) ].
	self
		relocateTo: position
		handleAtTop: positioner positionPreferredIsTop
		atLeft: positioner positionPreferredIsLeft
]
