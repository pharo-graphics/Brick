Class {
	#name : #BrAnchoredTopRightReferencePoint,
	#superclass : #BrAnchoredReferencePoint,
	#category : #'Brick-Anchored - Support'
}

{ #category : #accessing }
BrAnchoredTopRightReferencePoint class >> label [
	^ 'Top right'
]

{ #category : #'as yet unclassified' }
BrAnchoredTopRightReferencePoint >> from: aBounds [
	^ aBounds topRight
]
