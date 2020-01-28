Class {
	#name : #BrAnchoredBottomCenterReferencePoint,
	#superclass : #BrAnchoredReferencePoint,
	#category : #'Brick-Anchored - Support'
}

{ #category : #'as yet unclassified' }
BrAnchoredBottomCenterReferencePoint >> from: aBounds [
	^ aBounds bottomCenter
]
