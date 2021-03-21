Class {
	#name : #BrAnchoredBottomRightReferencePoint,
	#superclass : #BrAnchoredReferencePoint,
	#category : #'Brick-Anchored - Support'
}

{ #category : #accessing }
BrAnchoredBottomRightReferencePoint class >> label [
	^ 'Bottom right'
]

{ #category : #'as yet unclassified' }
BrAnchoredBottomRightReferencePoint >> from: aBounds [
	^ aBounds bottomRight
]
