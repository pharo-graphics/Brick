Class {
	#name : #BrLayoutVerticalResizerRequest,
	#superclass : #BrLayoutResizerRequest,
	#category : #'Brick-! Deprecated'
}

{ #category : #testing }
BrLayoutVerticalResizerRequest class >> isDeprecated [
	^ true
]

{ #category : #initialization }
BrLayoutVerticalResizerRequest >> responseClass [
	^ BrLayoutVerticalResizerChanged
]
