Class {
	#name : #BrLayoutVerticalResizerRequest,
	#superclass : #BrLayoutResizerRequest,
	#category : #'Brick-Layout Resizer - Events'
}

{ #category : #initialization }
BrLayoutVerticalResizerRequest >> responseClass [
	^ BrLayoutVerticalResizerChanged
]
