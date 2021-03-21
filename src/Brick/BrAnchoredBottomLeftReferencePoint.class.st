Class {
	#name : #BrAnchoredBottomLeftReferencePoint,
	#superclass : #BrAnchoredReferencePoint,
	#category : #'Brick-Anchored - Support'
}

{ #category : #accessing }
BrAnchoredBottomLeftReferencePoint class >> label [
	^ 'Bottom left'
]

{ #category : #'as yet unclassified' }
BrAnchoredBottomLeftReferencePoint >> from: aBounds [
	^ aBounds bottomLeft
]
