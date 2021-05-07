Class {
	#name : #BrGlamorousSpaceTabGroupAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Glamorous-Tabs - Space'
}

{ #category : #initialization }
BrGlamorousSpaceTabGroupAptitude >> initialize [
	super initialize.

	self add: (BrGlamorousTabGroupHeaderAptitude new headerDo: [:e | e padding: (BlInsets top: 10 right: 10 bottom: 0 left: 10 ) ]).
	self add: BrTabGroupContentAptitude new.
	self add: BrLayoutResizerAptitude inherit.

	self addChangeProperty: #(widget layout) with: [ BlLinearLayout vertical ].

	self addChange: (BrLookChange new
		up: [ :e | self widgetDo: [ :aWidget | aWidget background: (BrGlamorousColors defaultHeaderBackgroundColor) ] ];
		down: [ :e |  ];
		yourself)
]
