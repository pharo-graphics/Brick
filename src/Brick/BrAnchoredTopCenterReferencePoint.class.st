Class {
	#name : #BrAnchoredTopCenterReferencePoint,
	#superclass : #BrAnchoredReferencePoint,
	#category : #'Brick-Anchored - Support'
}

{ #category : #'as yet unclassified' }
BrAnchoredTopCenterReferencePoint >> from: aBounds [
	^ aBounds topCenter
]
