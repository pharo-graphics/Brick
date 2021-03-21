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
BrAnchoredDelegateReferencePoint class >> label [
	^ 'Delegate'
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

{ #category : #initialization }
BrAnchoredDelegateReferencePoint >> initialize [
	super initialize.
	
	block := [ :theBounds | 0@0 ]
]
