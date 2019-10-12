Class {
	#name : #OLDBrGlamorousDropdownPopupEmbellisher,
	#superclass : #OLDBrDropdownPopupEmbellisher,
	#instVars : [
		'backgroundPaint',
		'border'
	],
	#category : #'Brick-Glamorous-Dropdown'
}

{ #category : #accessing }
OLDBrGlamorousDropdownPopupEmbellisher >> backgroundPaint [
	^ backgroundPaint
]

{ #category : #accessing }
OLDBrGlamorousDropdownPopupEmbellisher >> backgroundPaint: aColorOrPaint [
	backgroundPaint := aColorOrPaint.
	container ifNotNil: [ container background: aColorOrPaint ]
]

{ #category : #accessing }
OLDBrGlamorousDropdownPopupEmbellisher >> border [
	^ border
]

{ #category : #accessing }
OLDBrGlamorousDropdownPopupEmbellisher >> border: aBorder [
	border := aBorder.
	container ifNotNil: [ container border: aBorder ]
]

{ #category : #'api - instantiation' }
OLDBrGlamorousDropdownPopupEmbellisher >> buildDefault [
	<return: #Object>
	| geometry |
	super buildDefault.
	self
		flag: 'TODO find alternative to work around reflection to check for radius'.
	geometry := BrAnchoredGeometry
		cornerRadius:
			((toggle geometry respondsTo: #cornerRadii)
				ifTrue: [ toggle geometry cornerRadii max ]
				ifFalse: [ (toggle geometry respondsTo: #radius)
						ifTrue: [ toggle geometry radius ]
						ifFalse: [ 0 ] ])
		element: container.
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
OLDBrGlamorousDropdownPopupEmbellisher >> initialize [
	super initialize.
	
	backgroundPaint := Color white.
	border := BlBorder empty
]
