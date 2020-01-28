Class {
	#name : #BrAnchoredBottomLeftReferencePoint,
	#superclass : #BrAnchoredReferencePoint,
	#category : #'Brick-Anchored - Support'
}

{ #category : #'as yet unclassified' }
BrAnchoredBottomLeftReferencePoint >> from: aBounds [
	^ aBounds bottomLeft
]
