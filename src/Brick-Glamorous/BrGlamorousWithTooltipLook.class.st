Class {
	#name : #BrGlamorousWithTooltipLook,
	#superclass : #BrWithTooltipLook,
	#category : #'Brick-Glamorous-Tooltip'
}

{ #category : #'instance creation' }
BrGlamorousWithTooltipLook >> newContainer [
	^ super newContainer
		in: [ :e | 
			e
				geometry:
					(BrGlamorousDropdownGeometry new
						dropdown: e;
						cornerRadius: 5;
						yourself) ];
		background: Color white;
		border:
			(BlBorder
				paint: BrGlamorousColors defaultButtonBorderColor asBlPaint
				width: 1);
		look: BrShadowLook new;
		yourself
]
