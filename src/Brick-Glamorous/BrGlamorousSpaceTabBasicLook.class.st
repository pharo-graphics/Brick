Class {
	#name : #BrGlamorousSpaceTabBasicLook,
	#superclass : #BrTabLook,
	#category : #'Brick-Glamorous-Tabs - Support'
}

{ #category : #initialization }
BrGlamorousSpaceTabBasicLook >> initialize [
	super initialize.

	self add: BrGlamorousTabActionbarLook new.
	self add: BrLayoutResizerLook inherit.
	self add: (BrLayoutAlignmentLook forHorizontalLinearLayout).

	self add: (BrStyleCommonLook new
		default: [ :aStyle |
			aStyle margin: (BlInsets top: 0 right: 1).
			aStyle geometry: (BlRoundedRectangleGeometry cornerRadii: (BlCornerRadii new
				topLeft: 8;
				topRight: 8;
				bottomLeft: 0;
				bottomRight: 0)).
			aStyle padding: (BlInsets top: 4 left: 10 bottom: 4 right: 10) ];
		deselected: [ :aStyle | aStyle background: (Color white alpha: 0.4) ];
		when: [ :aState | aState deselected & aState hovered ]
			style: [ :aStyle | aStyle background: (Color white alpha: 0.6) ];
		selected: [ :aStyle | aStyle background: Color white ]).
]
