Class {
	#name : #BrAnchoredTopRightAvailableBounds,
	#superclass : #BrAnchoredAvailableBounds,
	#category : #'Brick-Anchored - Support'
}

{ #category : #accessing }
BrAnchoredTopRightAvailableBounds class >> label [
	^ 'Top right'
]

{ #category : #'as yet unclassified' }
BrAnchoredTopRightAvailableBounds >> in: aBounds from: aPoint [
	^ BrAnchoredOuterContainerBounds
		left: aPoint x
		top: aBounds top
		right: aBounds right
		bottom: aPoint y
		referencePoint: aPoint
]
