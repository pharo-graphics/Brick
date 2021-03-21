Class {
	#name : #BrAnchoredBottomCenterReferencePoint,
	#superclass : #BrAnchoredReferencePoint,
	#category : #'Brick-Anchored - Support'
}

{ #category : #accessing }
BrAnchoredBottomCenterReferencePoint class >> label [
	^ 'Bottom center'
]

{ #category : #'as yet unclassified' }
BrAnchoredBottomCenterReferencePoint >> from: aBounds [
	^ aBounds bottomCenter
]
