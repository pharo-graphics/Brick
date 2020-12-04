Class {
	#name : #BrLayoutHorizontalResizerRequest,
	#superclass : #BrLayoutResizerRequest,
	#category : #'Brick-Layout Resizer - Events'
}

{ #category : #testing }
BrLayoutHorizontalResizerRequest class >> isDeprecated [
	^ true
]

{ #category : #initialization }
BrLayoutHorizontalResizerRequest >> responseClass [
	^ BrLayoutHorizontalResizerChanged
]
