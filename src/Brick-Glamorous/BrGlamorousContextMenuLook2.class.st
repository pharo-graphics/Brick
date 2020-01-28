Class {
	#name : #BrGlamorousContextMenuLook2,
	#superclass : #BrContextMenuLook2,
	#category : #'Brick-Glamorous-Context Menu'
}

{ #category : #'instance creation' }
BrGlamorousContextMenuLook2 >> initialize [
	super initialize.
	self add: BrGlamorousAnchoredLook
]
