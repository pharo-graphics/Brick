Class {
	#name : #BrGlamorousContextMenuLook,
	#superclass : #BrContextMenuLook,
	#category : #'Brick-Glamorous-Context Menu'
}

{ #category : #'instance creation' }
BrGlamorousContextMenuLook >> initialize [
	super initialize.
	self
		add: BrShadowLook new;
		addChangeProperty: #(widget geometry)
			with: [ BrGlamorousAnchoredGeometry new
				element: widget;
				yourself ];
		addChangeProperty: #(widget background) with: [ Color white ];
		addChangeProperty: #(widget border)
			with: [ BlBorder
				paint: BrGlamorousColors defaultButtonBorderColor asBlPaint
				width: 1 ]
]
