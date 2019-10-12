Class {
	#name : #BrGlamorousTooltipLook,
	#superclass : #BrTooltipLook,
	#category : #'Brick-Glamorous-Tooltip'
}

{ #category : #initialization }
BrGlamorousTooltipLook >> initialize [
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
