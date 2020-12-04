Class {
	#name : #BrLayoutHorizontalExactResizerState,
	#superclass : #BrLayoutHorizontalResizerState,
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #printing }
BrLayoutHorizontalExactResizerState >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: 'exact'
]
