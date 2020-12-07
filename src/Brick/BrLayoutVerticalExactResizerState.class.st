Class {
	#name : #BrLayoutVerticalExactResizerState,
	#superclass : #BrLayoutVerticalResizerState,
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #converting }
BrLayoutVerticalExactResizerState >> asPropagated [
	"Exact resizer state should not be propagated, it should be converted to match parent"

	^ self shouldNotImplement
]

{ #category : #printing }
BrLayoutVerticalExactResizerState >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: 'exact'
]
