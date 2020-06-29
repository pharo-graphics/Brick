Class {
	#name : #BrGlamorousTabWithoutBarWithIconLook,
	#superclass : #BrTabLook,
	#category : #'Brick-Glamorous-Tabs'
}

{ #category : #initialization }
BrGlamorousTabWithoutBarWithIconLook >> initialize [
	super initialize.

	self add: (BrGlamorousButtonIconLook new).
	self add: BrLayoutResizerLook new inherit.
	self add: (BrLayoutAlignmentLook forHorizontalLinearLayout).
	
	self addChangeProperty: #(widget geometry) with: [ BlCircle new ].
	self addChangeProperty: #(widget padding) with: [ BlInsets top: 3 left: 3 bottom: 3 right: 3 ].
]
