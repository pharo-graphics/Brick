Class {
	#name : #BrAnchoredBottomLeftAvailableBounds,
	#superclass : #BrAnchoredAvailableBounds,
	#category : #'Brick-Anchored - Support'
}

{ #category : #'as yet unclassified' }
BrAnchoredBottomLeftAvailableBounds >> in: aBounds from: aPoint [
	^ BrAnchoredOuterContainerBounds
		left: aBounds left
		top: aPoint y
		right: aPoint x
		bottom: aBounds bottom
		referencePoint: aPoint
]
