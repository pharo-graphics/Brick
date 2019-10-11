Class {
	#name : #BrDropdownLook,
	#superclass : #BrAnchoredLook,
	#instVars : [
		'clickEventHandler'
	],
	#category : #'Brick-Dropdown - Look'
}

{ #category : #'as yet unclassified' }
BrDropdownLook >> anchorChangedClass [
	^ BrDropdownAnchorChanged
]

{ #category : #'as yet unclassified' }
BrDropdownLook >> anchorRequest [
	^ BrDropdownAnchorRequest new
]

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
	| positioner contentMaxBounds anchorBounds scale position scrollableContent |
	self assert: [ self canRelocate ].
	positioner := BrAnchoredPopupPositioner
		anchor: anchor
		target: widget parent.
	scale := widget globalScale.
	anchorBounds := positioner anchorBoundsInTarget.
	contentMaxBounds := positioner
		popupPreferredMaxBoundsInTarget: self unwrappedContent size * scale.
	scrollableContent := self scrollableContent.
	scrollableContent
		constraintsDo: [ :c | 
			c maxWidth: contentMaxBounds width.
			c maxHeight: contentMaxBounds height ].
	position := 0 @ 0.
	positioner popupPreferredPosition = (#bottom -> #right)
		ifTrue: [ position := anchorBounds topLeft ].
	positioner popupPreferredPosition = (#bottom -> #left)
		ifTrue: [ position := anchorBounds topRight
				- (scrollableContent width @ 0 * scale) ].
	positioner popupPreferredPosition = (#top -> #right)
		ifTrue: [ position := anchorBounds topLeft
				- (0 @ scrollableContent height * scale) ].
	positioner popupPreferredPosition = (#top -> #left)
		ifTrue:
			[ position := anchorBounds topRight - (scrollableContent size * scale) ].
	self
		relocateTo: position
		content: scrollableContent
		handleAtTop: positioner popupPreferredPositionIsTop
		atLeft: positioner popupPreferredPositionIsLeft
]

{ #category : #'as yet unclassified' }
BrDropdownLook >> relocateWishClass [
	^ BrDropdownRelocateWish
]
