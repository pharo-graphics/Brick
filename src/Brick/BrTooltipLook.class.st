Class {
	#name : #BrTooltipLook,
	#superclass : #BrAnchoredLook,
	#category : #'Brick-Tooltip - Look'
}

{ #category : #'as yet unclassified' }
BrTooltipLook >> anchorChangedClass [
	^ BrTooltipAnchorChanged
]

{ #category : #'as yet unclassified' }
BrTooltipLook >> anchorRequest [
	^ BrTooltipAnchorRequest new
]

{ #category : #'as yet unclassified' }
BrTooltipLook >> contentChangedClass [
	^ BrTooltipContentChanged
]

{ #category : #'as yet unclassified' }
BrTooltipLook >> contentRequest [
	^ BrTooltipContentRequest new
]

{ #category : #'as yet unclassified' }
BrTooltipLook >> handleChangedClass [
	^ BrTooltipHandleChanged
]

{ #category : #'as yet unclassified' }
BrTooltipLook >> handleRequest [
	^ BrTooltipHandleRequest new
]

{ #category : #'as yet unclassified' }
BrTooltipLook >> hideWish [
	^ BrTooltipHideWish new
]

{ #category : #'as yet unclassified' }
BrTooltipLook >> relocate [
	| positioner contentMaxBounds anchorBounds scale position scrollableContent |
	self assert: [ self canRelocate ].
	positioner := BrAnchoredPopupPositioner
		anchor: anchor
		target: widget parent.
	scale := widget globalScale.
	anchorBounds := positioner anchorBoundsInTarget.
	contentMaxBounds := positioner
		popupPreferredMaxBoundsInTarget: (self unwrappedContent size + (0 @ handle height)) * scale.
	scrollableContent := self scrollableContent.
	scrollableContent
		constraintsDo: [ :c | 
			c maxWidth: contentMaxBounds width.
			c maxHeight: contentMaxBounds height ].
	position := 0 @ 0.
	positioner popupPreferredPosition = (#bottom -> #right)
		ifTrue: [ position := anchorBounds bottomLeft ].
	positioner popupPreferredPosition = (#bottom -> #left)
		ifTrue: [ position := anchorBounds bottomRight
				- (scrollableContent width @ 0 * scale) ].
	positioner popupPreferredPosition = (#top -> #right)
		ifTrue: [ position := anchorBounds topLeft
				- (0 @ (scrollableContent height + handle height) * scale) ].
	positioner popupPreferredPosition = (#top -> #left)
		ifTrue: [ position := anchorBounds topRight
				- ((scrollableContent size + (0 @ handle height)) * scale) ].
	((anchor width min: widget width) - handle width) / 2
		in: [ :e | handle margin: (BlInsets left: e right: e) ].
	self
		relocateTo: position
		content: scrollableContent
		handleAtTop: positioner popupPreferredPositionIsTop
		atLeft: positioner popupPreferredPositionIsLeft
]

{ #category : #'as yet unclassified' }
BrTooltipLook >> relocateWishClass [
	^ BrTooltipRelocateWish
]
