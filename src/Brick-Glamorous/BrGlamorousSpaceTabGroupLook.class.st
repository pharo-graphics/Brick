Class {
	#name : #BrGlamorousSpaceTabGroupLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Tabs - Space'
}

{ #category : #initialization }
BrGlamorousSpaceTabGroupLook >> initialize [
	super initialize.

	self addAll: {
		BrGlamorousSpaceTabGroupHeaderLook new.
		BrTabGroupContentLook new contentDo: [ :anElement | anElement look: BrLayoutLook matchParent ].

		"layout of the tab whole group is linear vertical"
		BrLayoutLook linearVertical matchParent.
	}.
	
	self addChange: (BrLookChange new
		up: [ :e | self widgetDo: [ :aWidget | aWidget background: (Color veryVeryLightGray) ] ];
		down: [ :e |  ];
		yourself)
]
