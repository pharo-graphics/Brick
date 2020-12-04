Class {
	#name : #BrLayoutVerticalExactResizerState,
	#superclass : #BrLayoutVerticalResizerState,
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #printing }
BrLayoutVerticalExactResizerState >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: 'exact'
]
