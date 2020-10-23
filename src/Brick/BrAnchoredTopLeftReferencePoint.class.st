Class {
	#name : #BrAnchoredTopLeftReferencePoint,
	#superclass : #BrAnchoredReferencePoint,
	#category : #'Brick-Anchored - Support'
}

{ #category : #accessing }
BrAnchoredTopLeftReferencePoint class >> label [
	^ 'Top left'
]

{ #category : #'as yet unclassified' }
BrAnchoredTopLeftReferencePoint >> from: aBounds [
	^ aBounds topLeft
]
