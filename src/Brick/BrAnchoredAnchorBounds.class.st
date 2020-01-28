Class {
	#name : #BrAnchoredAnchorBounds,
	#superclass : #Object,
	#category : #'Brick-Anchored - Support'
}

{ #category : #converting }
BrAnchoredAnchorBounds class >> asBrAnchoredAnchorBounds [
	^ self new
]

{ #category : #converting }
BrAnchoredAnchorBounds >> asBrAnchoredAnchorBounds [
	^ self
]

{ #category : #geometry }
BrAnchoredAnchorBounds >> boundsIn: aReferenceElement [
	self subclassResponsibility
]
