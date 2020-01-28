Class {
	#name : #BrAnchoredBottomRightReferencePoint,
	#superclass : #BrAnchoredReferencePoint,
	#category : #'Brick-Anchored - Support'
}

{ #category : #'as yet unclassified' }
BrAnchoredBottomRightReferencePoint >> from: aBounds [
	^ aBounds bottomRight
]
