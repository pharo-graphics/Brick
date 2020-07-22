Class {
	#name : #BrGlamorousContextMenuLook,
	#superclass : #BrContextMenuLook,
	#category : #'Brick-Glamorous-Context Menu'
}

{ #category : #'instance creation' }
BrGlamorousContextMenuLook >> initialize [
	super initialize.

	self add: BrGlamorousAnchoredLook
]
