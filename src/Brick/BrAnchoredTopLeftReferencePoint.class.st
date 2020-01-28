Class {
	#name : #BrAnchoredTopLeftReferencePoint,
	#superclass : #BrAnchoredReferencePoint,
	#category : #'Brick-Anchored - Support'
}

{ #category : #'as yet unclassified' }
BrAnchoredTopLeftReferencePoint >> from: aBounds [
	^ aBounds topLeft
]
