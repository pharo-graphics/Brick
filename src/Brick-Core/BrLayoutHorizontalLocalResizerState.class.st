Class {
	#name : #BrLayoutHorizontalLocalResizerState,
	#superclass : #BrLayoutHorizontalResizerState,
	#category : #'Brick-Core-Layout Resizer'
}

{ #category : #converting }
BrLayoutHorizontalLocalResizerState >> asPropagated [
	^ self shouldNotImplement
]

{ #category : #printing }
BrLayoutHorizontalLocalResizerState >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: 'local'
]
