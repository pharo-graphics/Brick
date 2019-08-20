Class {
	#name : #BrGlamorousSpaceTabGroupLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Tabs - Space'
}

{ #category : #initialization }
BrGlamorousSpaceTabGroupLook >> initialize [
	super initialize.

	self add: BrGlamorousSpaceTabGroupHeaderLook new.
	self add: BrTabGroupContentLook new.

	self add: BrLayoutResizerLook new.	

	self addChangeProperty: #(widget layout) with: [ BlLinearLayout vertical ].
	
	self addChange: (BrLookChange new
		up: [ :e | self widgetDo: [ :aWidget | aWidget background: (Color veryVeryLightGray) ] ];
		down: [ :e |  ];
		yourself)
]
