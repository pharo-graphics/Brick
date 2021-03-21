Class {
	#name : #BrAnchoredCenterRightReferencePoint,
	#superclass : #BrAnchoredReferencePoint,
	#category : #'Brick-Anchored - Support'
}

{ #category : #accessing }
BrAnchoredCenterRightReferencePoint class >> label [
	^ 'Center right'
]

{ #category : #'as yet unclassified' }
BrAnchoredCenterRightReferencePoint >> from: aBounds [
	^ aBounds centerRight
]
