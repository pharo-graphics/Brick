Class {
	#name : #BrLayoutHorizontalExactResizerState,
	#superclass : #BrLayoutHorizontalResizerState,
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #converting }
BrLayoutHorizontalExactResizerState >> asPropagated [
	"Exact resizer state should not be propagated, it should be converted to match parent"

	^ self shouldNotImplement
]

{ #category : #printing }
BrLayoutHorizontalExactResizerState >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: 'exact'
]
