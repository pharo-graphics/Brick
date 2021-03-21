Class {
	#name : #BrLayoutHorizontalResizerRequest,
	#superclass : #BrLayoutResizerRequest,
	#category : #'Brick-! Deprecated'
}

{ #category : #testing }
BrLayoutHorizontalResizerRequest class >> isDeprecated [
	^ true
]

{ #category : #initialization }
BrLayoutHorizontalResizerRequest >> responseClass [
	^ BrLayoutHorizontalResizerChanged
]
