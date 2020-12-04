Class {
	#name : #BrGlamorousCheckboxLook,
	#superclass : #BrLook,
	#instVars : [
		'iconLook'
	],
	#category : #'Brick-Glamorous-Checkbox'
}

{ #category : #initialization }
BrGlamorousCheckboxLook >> initialize [
	super initialize.
	
	self add: BrLayoutResizerLook inherit.
	self add: BrLayoutAlignmentLook forHorizontalLinearLayout.

	self add: (iconLook := BrIconLook new icon: (BrGlamorousVectorIcons checkbox asElement
		size: 8@8;
		background: BrGlamorousColors darkBorderColor muchDarker)).

	self add: (BrCheckboxLook new
		default: [ :aStyle |
			aStyle
				geometry: (BlRoundedRectangleGeometry cornerRadius: 2);
				background: Color white;
				border: (BlBorder paint: BrGlamorousColors defaultButtonBorderColor width: 1) ];
		hovered: [ :aStyle | aStyle border: (BlBorder paint: BrGlamorousColors darkBorderColor width: 1) ];
		checked: [ :aStyle | aStyle border: (BlBorder paint: BrGlamorousColors darkBorderColor width: 1) ]).
	
	self add: (BrCheckboxLook new
		target: #icon;
		unchecked: [ :aStyle | aStyle gone ];
		checked: [ :aStyle | aStyle visible ]).

	self add: (BrSizeAdjustmentLook new
		normal: [ :aStyle | 
			aStyle
				vExact: 16;
				hExact: 16 ])
]
