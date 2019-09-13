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
	container viewModel: (BrInteractiveModel new addStates: {
		BrExpandableModel new expand
	}).
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
	| positioner anchorBounds popupMaxBounds scale preferredPosition |
	container parent ifNil: [ ^ self ].
	positioner := BrAnchoredPopupPositioner
		anchor: anchor
		target: container parent.
	scale := anchor globalScale.
	anchorBounds := positioner anchorBoundsInTarget.
	popupMaxBounds := positioner
		popupPreferredMaxBoundsInTarget: popup size * scale.
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
		ifTrue: [ preferredPosition := anchorBounds topLeft ].
	positioner popupPreferredPosition = (#bottom -> #left)
		ifTrue: [ preferredPosition := anchorBounds topRight
				- (popupWrapper width @ 0 * scale) ].
	positioner popupPreferredPosition = (#top -> #right)
		ifTrue: [ preferredPosition := anchorBounds topLeft
				- (0 @ popupWrapper height * scale) ].
	positioner popupPreferredPosition = (#top -> #left)
		ifTrue: [ preferredPosition := anchorBounds topRight
				- (popupWrapper size * scale) ].
	self flag: 'TODO is there a better way to force the redraw of a geometry if bounds did not change?'.
	container
		transformDo: [ :t | 
			t
				origin: BlAffineTransformationTopLeftOrigin new;
				scaleBy: scale;
				translateBy: preferredPosition ];
		geometry: container geometry "force gemoetry redraw"
]

{ #category : #accessing }
BrDropdownPopupEmbellisher >> toggleStencil [
	^ toggleStencil
]

{ #category : #accessing }
BrDropdownPopupEmbellisher >> toggleStencil: anObject [
	toggleStencil := anObject
]
