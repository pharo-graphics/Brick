Class {
	#name : #BrAnchoredTopAvailableBounds,
	#superclass : #BrAnchoredAvailableBounds,
	#category : #'Brick-Anchored - Support'
}

{ #category : #accessing }
BrAnchoredTopAvailableBounds class >> label [
	^ 'Top'
]

{ #category : #'as yet unclassified' }
BrAnchoredTopAvailableBounds >> in: aBounds from: aPoint [
	^ BrAnchoredOuterContainerBounds
		  left: aBounds left
		  top: aBounds top
		  right: aBounds right
		  bottom: aPoint y
		  referencePoint: aPoint
]
