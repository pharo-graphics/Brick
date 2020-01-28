Class {
	#name : #BrAnchoredTopCenterAvailableBounds,
	#superclass : #BrAnchoredAvailableBounds,
	#category : #'Brick-Anchored - Support'
}

{ #category : #'as yet unclassified' }
BrAnchoredTopCenterAvailableBounds >> in: aBounds from: aPoint [
	| width |
	width := aBounds width - aPoint x min: aPoint x.
	^ BrAnchoredOuterContainerBounds
		left: aPoint x - width
		top: aBounds top
		right: aPoint x + width
		bottom: aPoint y
		referencePoint: aPoint
]
