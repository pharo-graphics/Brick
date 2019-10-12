Class {
	#name : #BrTooltipLook,
	#superclass : #BrAnchoredLook,
	#category : #'Brick-Tooltip - Look'
}

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
	| positioner contentMaxBounds anchorBounds scale position |
	self assert: [ self canRelocate ].
	positioner := BrAnchoredPositioner
		anchor: widget anchor
		target: widget parent.
	scale := widget anchor globalScale.
	anchorBounds := positioner anchorBoundsInTarget.
	contentMaxBounds := positioner
		maxBoundsPreferredInTarget: (content size + (0 @ handle height)) * scale.
	scrollableContent
		constraintsDo: [ :c | 
			c maxWidth: contentMaxBounds width / scale.
			c maxHeight: contentMaxBounds height /scale ].
	position := 0 @ 0.
	positioner positionPreferred = (#bottom -> #right)
		ifTrue: [ position := anchorBounds bottomLeft ].
	positioner positionPreferred = (#bottom -> #left)
		ifTrue: [ position := anchorBounds bottomRight
				- (scrollableContent width @ 0 * scale) ].
	positioner positionPreferred = (#top -> #right)
		ifTrue: [ position := anchorBounds topLeft
				- (0 @ (scrollableContent height + handle height) * scale) ].
	positioner positionPreferred = (#top -> #left)
		ifTrue: [ position := anchorBounds topRight
				- ((scrollableContent size + (0 @ handle height)) * scale) ].
	((widget anchor width min: widget width) - handle width) / 2
		in: [ :e | handle margin: (BlInsets left: e right: e) ].
	self
		relocateTo: position
		handleAtTop: positioner positionPreferredIsTop
		atLeft: positioner positionPreferredIsLeft
]

{ #category : #'as yet unclassified' }
BrTooltipLook >> relocateWishClass [
	^ BrTooltipRelocateWish
]
