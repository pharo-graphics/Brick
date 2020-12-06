Class {
	#name : #BrGlamorousTabLook,
	#superclass : #BrTabLook,
	#instVars : [
		'bar'
	],
	#category : #'Brick-Glamorous-Tabs'
}

{ #category : #initialization }
BrGlamorousTabLook >> initialize [
	super initialize.

	self add: (BrGlamorousTextLabelLook new foreground: Color black).
	self add: BrGlamorousTabActionbarLook new.
	self add: BrLayoutResizerLook inherit.
	self add: (BrLayoutAlignmentLook forHorizontalLinearLayout).

	bar := BlElement new
		visibility: BlVisibility hidden;
		background: BrGlamorousColors primaryBorderColor;
		constraintsDo: [ :c | 
			c ignoreByLayout.
			c ignored vertical alignBottom.
			c vertical exact: 2.
			c horizontal matchParent ].

	self add: (BrStyleCommonLook new
		default: [ :aStyle | aStyle padding: (BlInsets top: 10 left: 12 bottom: 10 right: 12) ]).

	self add: (BrStyleCommonLook new
		target: bar;
		deselected: [ :aStyle | aStyle hidden ];
		selected: [ :aStyle | aStyle visible ]).

	self addChangeAddChildAs: #(content bar) with: [ bar ]
]
