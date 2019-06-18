Class {
	#name : #BrDropdownPopupEmbellisher,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'anchor',
		'toggleStencil',
		'popupStencil',
		'container',
		'toggle',
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

{ #category : #'as yet unclassified' }
BrDropdownPopupEmbellisher >> anchorPosition [
	| toggleBoundsInTarget targetSize containerSize |
	self assert: [ container parent isNotNil ].
	toggleBoundsInTarget := anchor bounds inSpace
		inChild: container parent.
	targetSize := container parent size.
	containerSize := popup size + (0 @ anchor height).
	targetSize - toggleBoundsInTarget topLeft >= containerSize
		ifTrue: [ ^ #top -> #left ].
	targetSize - (toggleBoundsInTarget topRight - (container width @ 0))
		>= containerSize
		ifTrue: [ ^ #top -> #right ].
	targetSize
		- (toggleBoundsInTarget bottomLeft - (0 @ container height))
		>= containerSize
		ifTrue: [ ^ #bottom -> #left ].
	targetSize
		-
			(toggleBoundsInTarget bottomRight
				- (container width @ container height)) >= containerSize
		ifTrue: [ ^ #bottom -> #right ].
	^ #top -> #left
]

{ #category : #'api - instantiation' }
BrDropdownPopupEmbellisher >> buildDefault [
	<return: #BlElement>
	| content |
	container := BlElement new.
	container
		when: BlElementExtentChangedEvent
		do: [ self relocatePopup ].
	container
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
	popup := self popupStencil asElement.
	self
		flag: 'DOCUMENT popup size is computed, unless scrollable is provided'.
	content := popup asScrollableElement.
	content == popup
		ifFalse: [ content
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ] ].
	content
		constraintsDo: [ :c | 
			c grid horizontal
				alignLeft;
				weight: 1.
			c grid vertical
				alignTop;
				weight: 1 ].
	container addChild: toggle as: #toggle.
	container addChild: content as: #popup.
	^ container
]

{ #category : #'api - instantiation' }
BrDropdownPopupEmbellisher >> paramsOn: aStencilExecutor [
	aStencilExecutor
		push: self popupStencil;
		push: self toggleStencil
]

{ #category : #'as yet unclassified' }
BrDropdownPopupEmbellisher >> popupPositionFrom: aWidget [
	| toggleBoundsInTarget targetSize containerSize |
	container parent ifNil: [ ^ 0 @ 0 ].
	toggleBoundsInTarget := aWidget bounds inSpace
		inChild: container parent.
	targetSize := container parent size.
	containerSize := popup size + (0 @ toggle height).
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
	| p |
	p := self popupPositionFrom: anchor.
	container relocate: p
]

{ #category : #accessing }
BrDropdownPopupEmbellisher >> toggleStencil [
	^ toggleStencil
]

{ #category : #accessing }
BrDropdownPopupEmbellisher >> toggleStencil: anObject [
	toggleStencil := anObject
]
