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
	positioner := BrAnchoredPopupPositioner
		anchorBoundsInTarget:
			((widget anchor localPointToGlobal: relocation) - (handle size / 2 * scale)
				extent: handle size * scale)
		target: widget parent.
	anchorBounds := positioner anchorBoundsInTarget.
	contentMaxBounds := positioner
		popupPreferredMaxBoundsInTarget: content size * scale.
	scrollableContent
		constraintsDo: [ :c | 
			c maxWidth: contentMaxBounds width / scale.
			c maxHeight: contentMaxBounds height /scale ].
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
		handleAtTop: positioner popupPreferredPositionIsTop
		atLeft: positioner popupPreferredPositionIsLeft
]

{ #category : #'as yet unclassified' }
BrContextMenuLook >> relocateWishClass [
	^ BrContextMenuRelocateWish
]
