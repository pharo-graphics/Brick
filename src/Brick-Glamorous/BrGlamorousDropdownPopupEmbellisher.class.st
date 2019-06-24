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
	self
		flag: 'TODO find alternative to work around reflection to check for radius'.
	geometry := BrGlamorousDropdownGeometry new
		dropdown: container;
		cornerRadius:
			((toggle geometry respondsTo: #cornerRadii)
				ifTrue: [ toggle geometry cornerRadii max ]
				ifFalse: [ (toggle geometry respondsTo: #radius)
						ifTrue: [ toggle geometry radius ]
						ifFalse: [ 0 ] ]);
		yourself.
	toggle
		addEventHandlerOn: BlElementExtentChangedEvent
		do: [ :anEvent | container invalidate ].
	toggle
		addEventHandlerOn: BlElementBorderChangedEvent
		do: [ :anEvent | 
			toggle border paint isTransparent
				ifFalse: [ toggle
						border: (toggle border copyWithPaint: BlTransparentPaint uniqueInstance) ] ].
	container geometry: geometry.
	container background: toggle background.
	container border: toggle border.
	container look: BrShadowLook new.
	^ container
]
