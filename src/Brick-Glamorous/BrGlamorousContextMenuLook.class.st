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
			with: [ BrGlamorousDropdownGeometry new
				dropdown: widget;
				cornerRadius: 5;
				yourself ];
		addChangeProperty: #(widget background) with: [ Color white ];
		addChangeProperty: #(widget border)
			with: [ BlBorder
				paint: BrGlamorousColors defaultButtonBorderColor asBlPaint
				width: 1 ]
]

{ #category : #'instance creation' }
BrGlamorousContextMenuLook >> newContainer [
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
