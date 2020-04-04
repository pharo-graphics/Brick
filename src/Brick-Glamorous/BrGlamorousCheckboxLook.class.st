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
		size: 10@10;
		background: Color white)).

	self add: (BrCheckboxLook new
		default: [ :aWidget | aWidget
			geometry: (BlRectangle cornerRadius: 2);
			border: (BlBorder paint: BrGlamorousColors defaultButtonBorderColor width: 1) ];
		hovered: [ :aWidget | aWidget border: (BlBorder paint: Color black width: 1) ];
		unchecked: [ :aWidget |
			aWidget background: Color transparent.
			iconLook iconDo: [ :anIcon | anIcon visibility: BlVisibility gone ]  ];
		checked: [ :aWidget |
			aWidget background: Color black.
			aWidget border: (BlBorder empty).
			iconLook iconDo: [ :anIcon | anIcon visibility: BlVisibility visible ] ]).

	self add: (BrSizeAdjustmentLook new
		default: [ :aWidget | 
			aWidget
				vExact: 16;
				hExact: 16 ])
]
