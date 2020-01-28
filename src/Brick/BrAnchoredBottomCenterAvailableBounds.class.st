Class {
	#name : #BrAnchoredBottomCenterAvailableBounds,
	#superclass : #BrAnchoredAvailableBounds,
	#category : #'Brick-Anchored - Support'
}

{ #category : #'as yet unclassified' }
BrAnchoredBottomCenterAvailableBounds >> in: aBounds from: aPoint [
	| width |
	width := aBounds width - aPoint x min: aPoint x.
	^ BrAnchoredOuterContainerBounds
		left: aPoint x - width
		top: aPoint y
		right: aPoint x + width
		bottom: aBounds bottom
		referencePoint: aPoint
]
