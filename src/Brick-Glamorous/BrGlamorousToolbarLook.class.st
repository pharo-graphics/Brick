Class {
	#name : #BrGlamorousToolbarLook,
	#superclass : #BrToolbarLook,
	#category : #'Brick-Glamorous-Toolbar'
}

{ #category : #initialization }
BrGlamorousToolbarLook >> initialize [
	super initialize.
	
	self add: (BrLayoutLook new layout: (BlGridLayout horizontal cellSpacing: 2); fitContent)
]
