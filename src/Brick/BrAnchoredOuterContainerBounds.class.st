Class {
	#name : #BrAnchoredOuterContainerBounds,
	#superclass : #BlBounds,
	#instVars : [
		'referencePoint'
	],
	#category : #'Brick-Anchored - Support'
}

{ #category : #'as yet unclassified' }
BrAnchoredOuterContainerBounds class >> left: aLeft top: aTop right: aRight bottom: aBottom referencePoint: aPoint [
	"All topLeft, bottomRight, and absoluteReferencePoint have the same origin."

	^ (self
		   left: aLeft
		   top: aTop
		   right: aRight
		   bottom: aBottom)
		  referencePoint: aPoint;
		  yourself
]

{ #category : #accessing }
BrAnchoredOuterContainerBounds >> referencePoint [
	^ referencePoint
]

{ #category : #accessing }
BrAnchoredOuterContainerBounds >> referencePoint: anObject [
	referencePoint := anObject
]
