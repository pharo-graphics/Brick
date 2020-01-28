Class {
	#name : #BrAnchoredCenterRightAvailableBounds,
	#superclass : #BrAnchoredAvailableBounds,
	#category : #'Brick-Anchored - Support'
}

{ #category : #'as yet unclassified' }
BrAnchoredCenterRightAvailableBounds >> in: aBounds from: aPoint [
	| height |
	height := aBounds height - aPoint y min: aPoint y.
	^ BrAnchoredOuterContainerBounds
		left: aPoint x
		top: aPoint y - height
		right: aBounds right
		bottom: aPoint y + height
		referencePoint: aPoint
]
