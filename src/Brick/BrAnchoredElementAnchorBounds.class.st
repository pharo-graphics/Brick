Class {
	#name : #BrAnchoredElementAnchorBounds,
	#superclass : #BrAnchoredAnchorBounds,
	#instVars : [
		'element'
	],
	#category : #'Brick-Anchored - Support'
}

{ #category : #accessing }
BrAnchoredElementAnchorBounds class >> element: anElement [
	^ self new
		element: anElement;
		yourself
]

{ #category : #accessing }
BrAnchoredElementAnchorBounds >> boundsIn: aReferenceElement [
	^ element bounds inParent: aReferenceElement
]

{ #category : #accessing }
BrAnchoredElementAnchorBounds >> element [
	^ element
]

{ #category : #accessing }
BrAnchoredElementAnchorBounds >> element: anObject [
	element := anObject
]
