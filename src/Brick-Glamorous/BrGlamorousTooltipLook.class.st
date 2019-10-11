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
			with: [ BrGlamorousAnchoredGeometry new
				element: widget;
				yourself ];
		addChangeProperty: #(widget background) with: [ Color white ];
		addChangeProperty: #(widget border)
			with: [ BlBorder
				paint: BrGlamorousColors defaultButtonBorderColor asBlPaint
				width: 1 ]
]

{ #category : #'instance creation' }
BrGlamorousTooltipLook >> newContainer [
	^ super newContainer
		in: [ :e | 
			e
				geometry:
					(BrGlamorousAnchoredGeometry new
						element: e;
						yourself) ];
		background: Color white;
		border:
			(BlBorder
				paint: BrGlamorousColors defaultButtonBorderColor asBlPaint
				width: 1);
		look: BrShadowLook new;
		yourself
]
