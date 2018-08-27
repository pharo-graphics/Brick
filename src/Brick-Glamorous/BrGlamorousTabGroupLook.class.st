Class {
	#name : #BrGlamorousTabGroupLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Tabs'
}

{ #category : #initialization }
BrGlamorousTabGroupLook >> initialize [
	super initialize.

	self addAll: {
		BrGlamorousTabGroupHeaderLook new.
		BrTabGroupContentLook new
			contentDo: [ :anElement | anElement look: BrLayoutLook matchParent ].

		"layout of the tab whole group is linear vertical"
		BrLayoutLook linearVertical matchParent.
	}
]
