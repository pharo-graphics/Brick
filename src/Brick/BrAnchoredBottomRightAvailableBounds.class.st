Class {
	#name : #BrAnchoredBottomRightAvailableBounds,
	#superclass : #BrAnchoredAvailableBounds,
	#category : #'Brick-Anchored - Support'
}

{ #category : #accessing }
BrAnchoredBottomRightAvailableBounds class >> label [
	^ 'Bottom right'
]

{ #category : #'as yet unclassified' }
BrAnchoredBottomRightAvailableBounds >> in: aBounds from: aPoint [
	^ BrAnchoredOuterContainerBounds
		left: aPoint x
		top: aPoint y
		right: aBounds right
		bottom: aBounds bottom
		referencePoint: aPoint
]
