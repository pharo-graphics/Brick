Class {
	#name : #BrAnchoredTopCenterReferencePoint,
	#superclass : #BrAnchoredReferencePoint,
	#category : #'Brick-Anchored - Support'
}

{ #category : #accessing }
BrAnchoredTopCenterReferencePoint class >> label [
	^ 'Top center'
]

{ #category : #'as yet unclassified' }
BrAnchoredTopCenterReferencePoint >> from: aBounds [
	^ aBounds topCenter
]
