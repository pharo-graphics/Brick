Class {
	#name : #BrGlamorousSpaceTabBasicLook,
	#superclass : #BrTabLook,
	#category : #'Brick-Glamorous-Tabs - Support'
}

{ #category : #initialization }
BrGlamorousSpaceTabBasicLook >> initialize [
	super initialize.

	self add: BrGlamorousTabActionbarLook new.
	self add: BrLayoutResizerLook new inherit.
	self add: (BrLayoutAlignmentLook forHorizontalLinearLayout).

	self add: (BrInteractiveCommonLook new
		default: [ :aWidget |
			aWidget padding: (BlInsets top: 4 left: 10 bottom: 4 right: 10) ];
		deselected: [ :aWidget | aWidget background: (Color white alpha: 0.4) ];
		hovered: [ :aWidget |
			aWidget background: (Color white alpha: 0.6) ];
		selected: [ :aWidget | aWidget background: Color white ]).

	self
		addChangeProperty: #(widget geometry)
		with: [ BlRectangle cornerRadii: (BlCornerRadii new
			topLeft: 8;
			topRight: 8;
			bottomLeft: 0;
			bottomRight: 0) ].

	self
		addChangeProperty: #(widget margin)
		with: [ BlInsets top: 0 right: 1 ]
]
