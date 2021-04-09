Class {
	#name : #BrAnchoredReferencePoint,
	#superclass : #Object,
	#category : #'Brick-Anchored - Support'
}

{ #category : #converting }
BrAnchoredReferencePoint class >> asBrAnchoredReferencePoint [
	^ self new
]

{ #category : #accessing }
BrAnchoredReferencePoint class >> label [
	^ self subclassResponsibility
]

{ #category : #converting }
BrAnchoredReferencePoint >> asBrAnchoredReferencePoint [
	^ self
]

{ #category : #'as yet unclassified' }
BrAnchoredReferencePoint >> from: aBounds [
	self subclassResponsibility
]
