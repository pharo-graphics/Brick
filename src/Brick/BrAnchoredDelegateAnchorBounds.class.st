Class {
	#name : #BrAnchoredDelegateAnchorBounds,
	#superclass : #BrAnchoredAnchorBounds,
	#instVars : [
		'block'
	],
	#category : #'Brick-Anchored - Support'
}

{ #category : #accessing }
BrAnchoredDelegateAnchorBounds class >> block: aBlock [
	^ self new
		block: aBlock;
		yourself
]

{ #category : #accessing }
BrAnchoredDelegateAnchorBounds >> block [
	^ block
]

{ #category : #accessing }
BrAnchoredDelegateAnchorBounds >> block: anObject [
	block := anObject
]

{ #category : #accessing }
BrAnchoredDelegateAnchorBounds >> boundsIn: aReferenceElement [
	^ block cull: aReferenceElement
]
