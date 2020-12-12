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

	self add: (iconLook := BrIconLook new icon: (BlElement new
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
		checked: [ :aStyle | aStyle geometry: BrGlamorousVectorIcons checkedCheckboxGeometry ];
		unchecked: [ :aStyle | aStyle geometry: BrGlamorousVectorIcons uncheckedCheckboxGeometry ];
		indeterminate: [ :aStyle | aStyle geometry: BrGlamorousVectorIcons indeterminateCheckboxGeometry ]).

	self add: (BrSizeAdjustmentLook new
		normal: [ :aStyle | 
			aStyle
				vExact: 16;
				hExact: 16 ];
		small: [ :aStyle | 
			aStyle
				vExact: 14;
				hExact: 14 ])
]
