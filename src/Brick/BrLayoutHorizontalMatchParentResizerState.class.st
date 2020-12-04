Class {
	#name : #BrLayoutHorizontalMatchParentResizerState,
	#superclass : #BrLayoutHorizontalResizerState,
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #printing }
BrLayoutHorizontalMatchParentResizerState >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: 'match parent'
]
