Class {
	#name : #BrAnchoredTopLeftAvailableBounds,
	#superclass : #BrAnchoredAvailableBounds,
	#category : #'Brick-Anchored - Support'
}

{ #category : #'as yet unclassified' }
BrAnchoredTopLeftAvailableBounds >> in: aBounds from: aPoint [
	^ BrAnchoredOuterContainerBounds
		left: aBounds left
		top: aBounds top
		right: aPoint x
		bottom: aPoint y
		referencePoint: aPoint
]
