Class {
	#name : #BrAnchoredDelegateReferencePoint,
	#superclass : #BrAnchoredReferencePoint,
	#instVars : [
		'block'
	],
	#category : #'Brick-Anchored - Support'
}

{ #category : #accessing }
BrAnchoredDelegateReferencePoint class >> block: aBlock [
	^ self new
		block: aBlock;
		yourself
]

{ #category : #accessing }
BrAnchoredDelegateReferencePoint >> block [
	^ block
]

{ #category : #accessing }
BrAnchoredDelegateReferencePoint >> block: anObject [
	block := anObject
]

{ #category : #'as yet unclassified' }
BrAnchoredDelegateReferencePoint >> from: aBounds [
	^ block cull: aBounds
]
