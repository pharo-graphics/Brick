Class {
	#name : #BrGlamorousDropdownPopupEmbellisher,
	#superclass : #BrDropdownPopupEmbellisher,
	#instVars : [
		'backgroundPaint',
		'border'
	],
	#category : #'Brick-Glamorous-Dropdown'
}

{ #category : #accessing }
BrGlamorousDropdownPopupEmbellisher >> backgroundPaint [
	^ backgroundPaint
]

{ #category : #accessing }
BrGlamorousDropdownPopupEmbellisher >> backgroundPaint: aColorOrPaint [
	backgroundPaint := aColorOrPaint.
	container ifNotNil: [ container background: aColorOrPaint ]
]

{ #category : #accessing }
BrGlamorousDropdownPopupEmbellisher >> border [
	^ border
]

{ #category : #accessing }
BrGlamorousDropdownPopupEmbellisher >> border: aBorder [
	border := aBorder.
	container ifNotNil: [ container border: aBorder ]
]

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
	container background: self backgroundPaint.
	container border: self border.
	container look: BrShadowLook new.
	container outskirts: BlOutskirts outside.
	^ container
]

{ #category : #initialization }
BrGlamorousDropdownPopupEmbellisher >> initialize [
	super initialize.
	
	backgroundPaint := Color white.
	border := BlBorder empty
]
