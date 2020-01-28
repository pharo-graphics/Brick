Class {
	#name : #BrAnchoredRightAvailableBounds,
	#superclass : #BrAnchoredAvailableBounds,
	#category : #'Brick-Anchored - Support'
}

{ #category : #'as yet unclassified' }
BrAnchoredRightAvailableBounds >> in: aBounds from: aPoint [
	^ BrAnchoredOuterContainerBounds
		  left: aPoint x
		  top: aBounds top
		  right: aBounds right
		  bottom: aBounds bottom
		  referencePoint: aPoint
]
