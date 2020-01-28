Class {
	#name : #BrGlamorousAnchoredLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Anchored'
}

{ #category : #'instance creation' }
BrGlamorousAnchoredLook >> initialize [
	super initialize.
	self
		add: BrShadowLook new;
		addChangeProperty: #(widget geometry)
			with: [ BrAnchoredGeometry cornerRadius: 4 element: widget ];
		addChangeProperty: #(widget background) with: [ Color white ];
		addChangeProperty: #(widget border)
			with: [ BlBorder
				paint: BrGlamorousColors defaultButtonBorderColor asBlPaint
				width: 1 ]
]
