Class {
	#name : #BrGlamorousSpaceTabGroupLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Tabs - Space'
}

{ #category : #initialization }
BrGlamorousSpaceTabGroupLook >> initialize [
	super initialize.

	self add: (BrGlamorousTabGroupHeaderLook new headerDo: [:e | e padding: (BlInsets top: 10 right: 10 bottom: 0 left: 10 ) ]).
	self add: BrTabGroupContentLook new.
	self add: BrLayoutResizerLook inherit.

	self addChangeProperty: #(widget layout) with: [ BlLinearLayout vertical ].

	self addChange: (BrLookChange new
		up: [ :e | self widgetDo: [ :aWidget | aWidget background: (BrGlamorousColors defaultHeaderBackgroundColor) ] ];
		down: [ :e |  ];
		yourself)
]
