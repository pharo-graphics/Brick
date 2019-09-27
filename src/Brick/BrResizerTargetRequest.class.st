Class {
	#name : #BrResizerTargetRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Resizer - Events'
}

{ #category : #initialization }
BrResizerTargetRequest >> responseClass [
	^ BrResizerTargetChanged
]
