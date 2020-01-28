Class {
	#name : #BrAnchoredCenterLeftAvailableBounds,
	#superclass : #BrAnchoredAvailableBounds,
	#category : #'Brick-Anchored - Support'
}

{ #category : #'as yet unclassified' }
BrAnchoredCenterLeftAvailableBounds >> in: aBounds from: aPoint [
	| height |
	height := aBounds height - aPoint y min: aPoint y.
	^ BrAnchoredOuterContainerBounds
		left: aBounds left
		top: aPoint y - height
		right: aPoint x
		bottom: aPoint y + height
		referencePoint: aPoint
]
