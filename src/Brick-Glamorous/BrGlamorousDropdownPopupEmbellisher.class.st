Class {
	#name : #BrGlamorousDropdownPopupEmbellisher,
	#superclass : #BrDropdownPopupEmbellisher,
	#category : #'Brick-Glamorous-Dropdown'
}

{ #category : #'api - instantiation' }
BrGlamorousDropdownPopupEmbellisher >> buildDefault [
	<return: #Object>
	| geometry |
	super buildDefault.
	geometry := BrGlamorousDropdownGeometry new
		dropdown: container;
		yourself.
	toggle
		addEventHandlerOn: BlElementExtentChangedEvent
		do: [ :anEvent | container invalidate ].
	toggle
		addEventHandlerOn: BlElementBorderChangedEvent
		do: [ :anEvent | 
			toggle border ~= BlBorder empty
				ifTrue: [ toggle border: BlBorder empty ] ].
	container geometry: geometry.
	container background: Color white.
	container look: BrShadowLook new.
	^ container
]
