Class {
	#name : #BrDropdownPopupEmbellisher,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'anchor',
		'toggleStencil',
		'popupStencil',
		'container',
		'toggle',
		'popupWrapper',
		'popup'
	],
	#category : #'Brick-Dropdown - Stencils'
}

{ #category : #accessing }
BrDropdownPopupEmbellisher >> anchor [
	^ anchor
]

{ #category : #accessing }
BrDropdownPopupEmbellisher >> anchor: anObject [
	anchor := anObject
]

{ #category : #'api - instantiation' }
BrDropdownPopupEmbellisher >> buildDefault [
	<return: #BlElement>
	container := BlElement new.
	container
		when: BlElementExtentChangedEvent
		do: [ self relocatePopup ].
	container
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ].
	toggle := self toggleStencil asElement.
	popup := self popupStencil asElement.
	self
		flag: 'DOCUMENT popup size is computed, unless scrollable is provided'.
	popupWrapper := popup asScrollableElement.
	popupWrapper == popup
		ifFalse: [ popupWrapper
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ] ].
	container addChild: toggle as: #toggle.
	container addChild: popupWrapper as: #popup.
	^ container
]

{ #category : #'api - instantiation' }
BrDropdownPopupEmbellisher >> paramsOn: aStencilExecutor [
	aStencilExecutor
		push: self popupStencil;
		push: self toggleStencil
]

{ #category : #accessing }
BrDropdownPopupEmbellisher >> popupStencil [
	^ popupStencil
]

{ #category : #accessing }
BrDropdownPopupEmbellisher >> popupStencil: anObject [
	popupStencil := anObject
]

{ #category : #geometry }
BrDropdownPopupEmbellisher >> relocatePopup [
	| positioner anchorBounds popupMaxBounds |
	container parent ifNil: [ ^ self ].
	positioner := BrAnchoredPopupPositioner
		anchor: anchor
		target: container parent.
	anchorBounds := positioner anchorBoundsInTarget.
	popupMaxBounds := positioner
		popupPreferredMaxBoundsInTarget: popup size.
	positioner popupPreferredPositionIsTop
		ifTrue: [ container
				removeChildren;
				addChildren:
					{popupWrapper.
					toggle} ]
		ifFalse: [ container
				removeChildren;
				addChildren:
					{toggle.
					popupWrapper} ].
	positioner popupPreferredPositionIsLeft
		ifTrue: [ toggle constraintsDo: [ :c | c linear horizontal alignRight ] ]
		ifFalse: [ toggle constraintsDo: [ :c | c linear horizontal alignLeft ] ].
	popupWrapper
		constraintsDo: [ :c | 
			c maxWidth: popupMaxBounds width.
			c maxHeight: popupMaxBounds height ].
	positioner popupPreferredPosition = (#bottom -> #right)
		ifTrue: [ container relocate: anchorBounds topLeft.
			^ self ].
	positioner popupPreferredPosition = (#bottom -> #left)
		ifTrue:
			[ container relocate: anchorBounds topRight - (popupWrapper width @ 0).
			^ self ].
	positioner popupPreferredPosition = (#top -> #right)
		ifTrue:
			[ container relocate: anchorBounds topLeft - (0 @ popupWrapper height).
			^ self ].
	self assert: [ positioner popupPreferredPosition = (#top -> #left) ].
	container relocate: anchorBounds topRight - popupWrapper size
]

{ #category : #accessing }
BrDropdownPopupEmbellisher >> toggleStencil [
	^ toggleStencil
]

{ #category : #accessing }
BrDropdownPopupEmbellisher >> toggleStencil: anObject [
	toggleStencil := anObject
]
