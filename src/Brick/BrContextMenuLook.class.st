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
	| positioner contentMaxBounds anchorBounds scale position scrollableContent |
	self assert: [ self canRelocate ].
	positioner := BrAnchoredPopupPositioner
		anchorBoundsInTarget:
			((widget anchor localPointToGlobal: relocation) - (handle size / 2)
				extent: handle size)
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
BrContextMenuLook >> relocateWishClass [
	^ BrContextMenuRelocateWish
]
