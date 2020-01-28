Class {
	#name : #BrAnchoredScaleFactor,
	#superclass : #Object,
	#category : #'Brick-Anchored - Support'
}

{ #category : #converting }
BrAnchoredScaleFactor class >> asBrAnchoredScaleFactor [
	^ self new
]

{ #category : #converting }
BrAnchoredScaleFactor >> asBrAnchoredScaleFactor [
	^ self
]

{ #category : #'as yet unclassified' }
BrAnchoredScaleFactor >> factorIn: aReferenceElement [
	self subclassResponsibility
]
