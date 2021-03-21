Class {
	#name : #BrAnchoredCenterLeftReferencePoint,
	#superclass : #BrAnchoredReferencePoint,
	#category : #'Brick-Anchored - Support'
}

{ #category : #accessing }
BrAnchoredCenterLeftReferencePoint class >> label [
	^ 'Center left'
]

{ #category : #'as yet unclassified' }
BrAnchoredCenterLeftReferencePoint >> from: aBounds [
	^ aBounds centerLeft
]
