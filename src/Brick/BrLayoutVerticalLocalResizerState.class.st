Class {
	#name : #BrLayoutVerticalLocalResizerState,
	#superclass : #BrLayoutVerticalResizerState,
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #converting }
BrLayoutVerticalLocalResizerState >> asPropagated [
	^ self shouldNotImplement
]

{ #category : #printing }
BrLayoutVerticalLocalResizerState >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: 'local'
]
