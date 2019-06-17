Class {
	#name : #BrDropdownPopupEmbellisher,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'toggleStencil',
		'toggleElement',
		'popupElement',
		'container'
	],
	#category : #'Brick-Dropdown - Stencils'
}

{ #category : #'api - instantiation' }
BrDropdownPopupEmbellisher >> buildDefault [
	<return: #Object>
	| aContainer toggle popup |
	aContainer := BlElement new.
	aContainer when: BlElementExtentChangedEvent do: [ self relocatePopup ].
	aContainer
		layout:
			(BlGridLayout new
				columnCount: 1;
				rowCount: 2);
		constraintsDo: [ :c | 
			c ignoreByLayout.
			c horizontal fitContent.
			c vertical fitContent ].
	toggle := self toggleStencil asElement.
	toggle
		constraintsDo: [ :c | 
			c grid horizontal
				alignLeft;
				weight: 0.
			c grid vertical
				alignBottom;
				weight: 0 ].
	popup := self popupElement.
	popup
		constraintsDo: [ :c | 
			c grid horizontal
				alignLeft;
				weight: 1.
			c grid vertical
				alignTop;
				weight: 1 ].
	aContainer addChild: toggle as: #toggle.
	aContainer addChild: popup as: #popup.
	container := aContainer.
	^ aContainer
]

{ #category : #'api - instantiation' }
BrDropdownPopupEmbellisher >> paramsOn: aStencilExecutor [
	aStencilExecutor
		push: self popupElement;
		push: self toggleStencil
]

{ #category : #accessing }
BrDropdownPopupEmbellisher >> popupElement [
	^ popupElement
]

{ #category : #accessing }
BrDropdownPopupEmbellisher >> popupElement: anObject [
	popupElement := anObject
]

{ #category : #'as yet unclassified' }
BrDropdownPopupEmbellisher >> popupPositionFrom: aWidget [
	| toggleBoundsInTarget targetSize containerSize |
	container parent ifNil: [ ^ 0 @ 0 ].
	toggleBoundsInTarget := aWidget bounds inSpace
		inChild: container parent.
	targetSize := container parent size.
	containerSize := container size.
	targetSize - toggleBoundsInTarget topLeft >= containerSize
		ifTrue: [ ^ toggleBoundsInTarget topLeft ].
	targetSize - (toggleBoundsInTarget topRight - (container width @ 0))
		>= containerSize
		ifTrue: [ ^ toggleBoundsInTarget topRight - (container width @ 0) ].
	targetSize
		- (toggleBoundsInTarget bottomLeft - (0 @ container height))
		>= containerSize
		ifTrue: [ ^ toggleBoundsInTarget bottomLeft - (0 @ container height) ].
	targetSize
		-
			(toggleBoundsInTarget bottomRight
				- (container width @ container height)) >= containerSize
		ifTrue: [ ^ toggleBoundsInTarget bottomRight
				- (container width @ container height) ].
	^ toggleBoundsInTarget topLeft
]

{ #category : #geometry }
BrDropdownPopupEmbellisher >> relocatePopup [
	| p |
	p := self popupPositionFrom: toggleElement.
	container relocate: p
]

{ #category : #accessing }
BrDropdownPopupEmbellisher >> toggleElement [
	^ toggleElement
]

{ #category : #accessing }
BrDropdownPopupEmbellisher >> toggleElement: anObject [
	toggleElement := anObject
]

{ #category : #accessing }
BrDropdownPopupEmbellisher >> toggleStencil [
	^ toggleStencil
]

{ #category : #accessing }
BrDropdownPopupEmbellisher >> toggleStencil: anObject [
	toggleStencil := anObject
]
