Class {
	#name : #BrGlamorousSpaceTabLook,
	#superclass : #BrTabLook,
	#instVars : [
		'labelLook'
	],
	#category : #'Brick-Glamorous-Tabs - Space'
}

{ #category : #initialization }
BrGlamorousSpaceTabLook >> initialize [
	super initialize.

	self add: (BrGlamorousTextLabelLook new foreground: Color black).
	self add: BrGlamorousTabActionbarLook new.
	self add: BrLayoutResizerLook new inherit.
	self add: (BrLayoutAlignmentLook forHorizontalLinearLayout).

	self add: (BrInteractiveCommonLook new
		default: [ :aWidget |
			aWidget padding: (BlInsets top: 6 left: 12 bottom: 6 right: 12) ];
		deselected: [ :aWidget | aWidget background: (Color white alpha: 0.4) ];
		hovered: [ :aWidget |
			aWidget background: (Color white alpha: 0.6) ];
		selected: [ :aWidget | aWidget background: Color white ]).

	self
		addChangeProperty: #(widget geometry)
		with: [ BlRectangle cornerRadii: (BlCornerRadii new
			topLeft: 12;
			topRight: 12;
			bottomLeft: 0;
			bottomRight: 0) ].

	self
		addChangeProperty: #(widget margin)
		with: [ BlInsets top: 10 right: 1 ]
]
