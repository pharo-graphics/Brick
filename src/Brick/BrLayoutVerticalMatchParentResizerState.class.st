Class {
	#name : #BrLayoutVerticalMatchParentResizerState,
	#superclass : #BrLayoutVerticalResizerState,
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #printing }
BrLayoutVerticalMatchParentResizerState >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: 'match parent'
]
