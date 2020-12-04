Class {
	#name : #BrLayoutVerticalResizerRequest,
	#superclass : #BrLayoutResizerRequest,
	#category : #'Brick-Layout Resizer - Events'
}

{ #category : #testing }
BrLayoutVerticalResizerRequest class >> isDeprecated [
	^ true
]

{ #category : #initialization }
BrLayoutVerticalResizerRequest >> responseClass [
	^ BrLayoutVerticalResizerChanged
]
