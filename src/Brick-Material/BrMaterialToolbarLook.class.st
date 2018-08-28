Class {
	#name : #BrMaterialToolbarLook,
	#superclass : #BrToolbarLook,
	#category : #'Brick-Material-Toolbar'
}

{ #category : #initialization }
BrMaterialToolbarLook >> initialize [
	super initialize.
	
	self add: (BrLayoutLook new layout: (BlGridLayout horizontal cellSpacing: 7); fitContent)
]
