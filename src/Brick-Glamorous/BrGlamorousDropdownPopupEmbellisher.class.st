Class {
	#name : #BrGlamorousDropdownPopupEmbellisher,
	#superclass : #BrDropdownPopupEmbellisher,
	#category : #'Brick-Glamorous-Dropdown'
}

{ #category : #'api - instantiation' }
BrGlamorousDropdownPopupEmbellisher >> buildDefault [
	<return: #Object>
	| aContainer geometry toggleElement |
	aContainer := super buildDefault.
	geometry := BrGlamorousDropdownGeometry new.
	toggleElement := aContainer childNamed: #toggle.
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
	"aContainer geometry: geometry."
	aContainer background: Color white.
	aContainer look: BrShadowLook new.
	^ aContainer
]
