Class {
	#name : #BrAnchoredPointAnchorBounds,
	#superclass : #BrAnchoredAnchorBounds,
	#instVars : [
		'point'
	],
	#category : #'Brick-Anchored - Support'
}

{ #category : #accessing }
BrAnchoredPointAnchorBounds class >> point: aPoint [
	^ self new
		point: aPoint;
		yourself
]

{ #category : #accessing }
BrAnchoredPointAnchorBounds >> boundsIn: aReferenceElement [
	^ BlBounds origin: point corner: point
]

{ #category : #accessing }
BrAnchoredPointAnchorBounds >> point [
	^ point
]

{ #category : #accessing }
BrAnchoredPointAnchorBounds >> point: anObject [
	point := anObject
]
