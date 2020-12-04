Class {
	#name : #BrLayoutHorizontalLocalResizerState,
	#superclass : #BrLayoutHorizontalResizerState,
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #printing }
BrLayoutHorizontalLocalResizerState >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: 'local'
]
