Class {
	#name : #BrDropdownLook,
	#superclass : #BrAnchoredLook,
	#instVars : [
		'clickEventHandler'
	],
	#category : #'Brick-Dropdown - Look'
}

{ #category : #'as yet unclassified' }
BrDropdownLook >> contentChangedClass [
	^ BrDropdownContentChanged
]

{ #category : #'as yet unclassified' }
BrDropdownLook >> contentRequest [
	^ BrDropdownContentRequest new
]

{ #category : #accessing }
BrDropdownLook >> handle: anElement [
	handle removeEventFilter: clickEventHandler.
	super handle: anElement.
	handle addEventFilter: clickEventHandler
]

{ #category : #'as yet unclassified' }
BrDropdownLook >> handleChangedClass [
	^ BrDropdownHandleChanged
]

{ #category : #'as yet unclassified' }
BrDropdownLook >> handleRequest [
	^ BrDropdownHandleRequest new
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

{ #category : #'as yet unclassified' }
BrDropdownLook >> relocateWishClass [
	^ BrDropdownRelocateWish
]
