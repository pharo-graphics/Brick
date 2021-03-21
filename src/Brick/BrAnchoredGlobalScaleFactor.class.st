Class {
	#name : #BrAnchoredGlobalScaleFactor,
	#superclass : #BrAnchoredScaleFactor,
	#category : #'Brick-Anchored - Support'
}

{ #category : #'as yet unclassified' }
BrAnchoredGlobalScaleFactor >> factorIn: aReferenceElement [
	^ 1 / aReferenceElement globalScale
]
