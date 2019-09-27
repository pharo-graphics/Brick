Class {
	#name : #BrResizerLocationRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Resizer - Events'
}

{ #category : #initialization }
BrResizerLocationRequest >> responseClass [
	^ BrResizerLocationChanged
]
