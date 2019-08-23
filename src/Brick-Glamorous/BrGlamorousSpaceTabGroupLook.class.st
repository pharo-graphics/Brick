Class {
	#name : #BrGlamorousSpaceTabGroupLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Tabs - Space'
}

{ #category : #initialization }
BrGlamorousSpaceTabGroupLook >> initialize [
	| aTopPadding |
	super initialize.
	
	"DO NOT TOUCH PADDING-TOP 22! This number is picked so that system window buttons are located in the center of the whitespace above tabs"
	aTopPadding := OSPlatform current isMacOSX
		ifTrue: [ 22 ]
		ifFalse: [ 10 ].

	self add: (BrGlamorousTabGroupHeaderLook new headerDo: [:e | e padding: (BlInsets top: aTopPadding right: 10 bottom: 0 left: 10 ) ]).
	self add: BrTabGroupContentLook new.
	self add: BrLayoutResizerLook inherit.

	self addChangeProperty: #(widget layout) with: [ BlLinearLayout vertical ].

	self addChange: (BrLookChange new
		up: [ :e | self widgetDo: [ :aWidget | aWidget background: (BrGlamorousColors defaultHeaderBackgroundColor) ] ];
		down: [ :e |  ];
		yourself)
]
