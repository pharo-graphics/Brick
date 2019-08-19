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
	self add: BrLayoutResizerLook new inherit.
	self add: (BrLayoutAlignmentLook forHorizontalLinearLayout).

	bar := BlElement new.
	bar visibility: BlVisibility hidden.
	bar background: BrGlamorousColors primaryBorderColor.
	bar constraintsDo: [ :c | 
		c ignoreByLayout.
		c ignored vertical alignBottom.
		c vertical exact: 2.
		c horizontal matchParent ].
	
	self add: (BrInteractiveCommonLook new
		default: [ :aWidget | aWidget padding: (BlInsets top: 10 left: 12 bottom: 10 right: 12) ];
		disabled: [  ];
		deselected: [ bar visibility: BlVisibility hidden ];
		selected: [ bar visibility: BlVisibility visible ]).
	
	self addChangeAddChildAs: #(content bar) with: [ bar ]
]

{ #category : #'event handling' }
BrGlamorousTabLook >> invisibleBar [
	bar background: Color transparent
]
