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
		default: [ :aWidget |
			aWidget
				geometry: (BlRectangle cornerRadius: 2);
				background: Color white;
				border: (BlBorder paint: BrGlamorousColors defaultButtonBorderColor width: 1) ];
		hovered: [ :aWidget | aWidget border: (BlBorder paint: BrGlamorousColors darkBorderColor width: 1) ];
		unchecked: [ :aWidget |
			iconLook iconDo: [ :anIcon | anIcon visibility: BlVisibility gone ]  ];
		checked: [ :aWidget |
			iconLook iconDo: [ :anIcon |
				aWidget border: (BlBorder paint: BrGlamorousColors darkBorderColor width: 1).
				anIcon visibility: BlVisibility visible ] ]).

	self add: (BrSizeAdjustmentLook new
		default: [ :aWidget | 
			aWidget
				vExact: 16;
				hExact: 16 ])
]
