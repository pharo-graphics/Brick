Class {
	#name : #BrGlamorousWithContextMenuLook,
	#superclass : #BrWithContextMenuLook,
	#category : #'Brick-Glamorous-Context Menu'
}

{ #category : #'instance creation' }
BrGlamorousWithContextMenuLook >> newContainer [
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
