Class {
	#name : #BrAnchoredHandleChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'handle'
	],
	#category : #'Brick-Anchored - Events'
}

{ #category : #accessing }
BrAnchoredHandleChanged >> handle [
	^ handle
]

{ #category : #accessing }
BrAnchoredHandleChanged >> handle: anObject [
	handle := anObject
]
