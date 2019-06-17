Class {
	#name : #BrDropdownPopupEmbellisher,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'toggleStencil',
		'toggleElement',
		'popupElement',
		'direction',
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
	direction := #bottom -> #left.
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
	| anOriginalToggle aToggleBoundsInContainer aPopupTarget theBoundsOfOriginalToggleInPopupTarget |

	anOriginalToggle := aWidget.
	aPopupTarget := container parent.

	theBoundsOfOriginalToggleInPopupTarget := (anOriginalToggle bounds inSpace inChild: aPopupTarget).
	

	true ifTrue: [ ^ theBoundsOfOriginalToggleInPopupTarget position ].
	

	aToggleBoundsInContainer := toggleElement bounds inParent: container parent.


	('widget ' , aWidget bounds inSpace topRight asString) logCr.
	container size = (0 @ 0)
		ifTrue: [ [ 2 seconds wait.
			self relocatePopup ] fork.
			^ container globalPointToParent: aWidget bounds inSpace topLeft ].
	('size: ' , (container width @ 0) asString) logCr.
	(aWidget bounds inSpace topRight - (container width @ 0)) asString logCr.
	direction = (#bottom -> #right)
		ifTrue: [ ^ container globalPointToParent: aWidget bounds inSpace topLeft ].
	direction = (#bottom -> #left)
		ifTrue: [ ^ container
				globalPointToParent: aWidget bounds inSpace topRight - (container width @ 0) ].
	direction = (#top -> #right)
		ifTrue: [ ^ container
				globalPointToParent: aWidget bounds inSpace topLeft - (0 @ container height) ].
	direction = (#top -> #left)
		ifTrue: [ ^ container
				globalPointToParent: aWidget bounds inSpace topRight - (container width @ container height) ].
	Error signal: 'direction not supported'
]

{ #category : #geometry }
BrDropdownPopupEmbellisher >> relocatePopup [
	| p |
	p := self popupPositionFrom: toggleElement.
	p asString logCr.
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
