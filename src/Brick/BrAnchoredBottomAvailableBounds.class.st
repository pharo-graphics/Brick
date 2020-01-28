Class {
	#name : #BrAnchoredBottomAvailableBounds,
	#superclass : #BrAnchoredAvailableBounds,
	#category : #'Brick-Anchored - Support'
}

{ #category : #'as yet unclassified' }
BrAnchoredBottomAvailableBounds >> in: aBounds from: aPoint [
	^ BrAnchoredOuterContainerBounds
		  left: aBounds left
		  top: aPoint y
		  right: aBounds right
		  bottom: aBounds bottom
		  referencePoint: aPoint
]
