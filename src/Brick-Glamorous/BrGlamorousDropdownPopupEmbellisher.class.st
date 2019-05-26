Class {
	#name : #BrGlamorousDropdownPopupEmbellisher,
	#superclass : #BrDropdownPopupEmbellisher,
	#category : #'Brick-Glamorous-Dropdown'
}

{ #category : #'api - instantiation' }
BrGlamorousDropdownPopupEmbellisher >> buildDefault [
	<return: #Object>
	| aContainer geometry toggleElement |
	aContainer := BlElement new.
	geometry := BrGlamorousDropdownGeometry new.
	toggleElement := self toggleStencil asElement.
	toggleElement
		addEventHandlerOn: BlElementExtentChangedEvent
		do: [ :anEvent | 
			geometry toggleExtent: toggleElement geometryBounds extent.
			aContainer invalidate ].
	toggleElement
		addEventHandlerOn: BlElementBorderChangedEvent
		do: [ :anEvent | 
			toggleElement border ~= BlBorder empty
				ifTrue: [ toggleElement border: BlBorder empty ] ].
	aContainer geometry: geometry.
	aContainer background: Color white.
	aContainer look: BrShadowLook new.
	aContainer layout: BlLinearLayout vertical.
	aContainer
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ].
	aContainer addChild: toggleElement as: #toggle.
	aContainer addChild: self popupElement as: #popup.
	^ aContainer
]
