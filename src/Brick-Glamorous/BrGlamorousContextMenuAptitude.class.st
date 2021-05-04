Class {
	#name : #BrGlamorousContextMenuAptitude,
	#superclass : #BrContextMenuAptitude,
	#category : #'Brick-Glamorous-Context Menu'
}

{ #category : #'instance creation' }
BrGlamorousContextMenuAptitude >> initialize [
	super initialize.

	self add: BrGlamorousAnchoredAptitude
]
