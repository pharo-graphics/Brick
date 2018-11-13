Class {
	#name : #BrGlamorousToolbarLook,
	#superclass : #BrToolbarLook,
	#category : #'Brick-Glamorous-Toolbar'
}

{ #category : #factory }
BrGlamorousToolbarLook class >> horizontal [
	^ self basicNew initialize beHorizontal
]

{ #category : #factory }
BrGlamorousToolbarLook class >> new [
	^ self horizontal
]

{ #category : #factory }
BrGlamorousToolbarLook class >> vertical [
	^ self basicNew initialize beVertical
]

{ #category : #initialization }
BrGlamorousToolbarLook >> beHorizontal [
	self add: (BrLayoutLook new layout: (BlGridLayout horizontal cellSpacing: 2); fitContent)
]

{ #category : #initialization }
BrGlamorousToolbarLook >> beVertical [
	self add: (BrLayoutLook new layout: (BlGridLayout vertical cellSpacing: 2); fitContent)
]
