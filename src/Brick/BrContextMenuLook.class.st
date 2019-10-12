Class {
	#name : #BrContextMenuLook,
	#superclass : #BrAnchoredLook,
	#category : #'Brick-Context Menu - Look'
}

{ #category : #'as yet unclassified' }
BrContextMenuLook >> contentChangedClass [
	^ BrContextMenuContentChanged
]

{ #category : #'as yet unclassified' }
BrContextMenuLook >> contentRequest [
	^ BrContextMenuContentRequest new
]

{ #category : #'as yet unclassified' }
BrContextMenuLook >> handleChangedClass [
	^ BrContextMenuHandleChanged
]

{ #category : #'as yet unclassified' }
BrContextMenuLook >> handleRequest [
	^ BrContextMenuHandleRequest new
]

{ #category : #'as yet unclassified' }
BrContextMenuLook >> hideWish [
	^ BrContextMenuHideWish new
]

{ #category : #'as yet unclassified' }
BrContextMenuLook >> relocate [
	| positioner contentMaxBounds anchorBounds scale position |
	self assert: [ self canRelocate ].
	scale := widget anchor globalScale.
	positioner := BrAnchoredPositioner
		anchorBoundsInTarget:
			((widget anchor localPointToGlobal: relocation) - (handle size / 2 * scale)
				extent: handle size * scale)
		target: widget parent.
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
BrContextMenuLook >> relocateWishClass [
	^ BrContextMenuRelocateWish
]
