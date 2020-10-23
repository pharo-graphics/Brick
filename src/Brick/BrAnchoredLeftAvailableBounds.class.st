Class {
	#name : #BrAnchoredLeftAvailableBounds,
	#superclass : #BrAnchoredAvailableBounds,
	#category : #'Brick-Anchored - Support'
}

{ #category : #accessing }
BrAnchoredLeftAvailableBounds class >> label [
	^ 'Left'
]

{ #category : #'as yet unclassified' }
BrAnchoredLeftAvailableBounds >> in: aBounds from: aPoint [
	^ BrAnchoredOuterContainerBounds
		  left: aBounds left
		  top: aBounds top
		  right: aPoint x
		  bottom: aBounds bottom
		  referencePoint: aPoint
]
