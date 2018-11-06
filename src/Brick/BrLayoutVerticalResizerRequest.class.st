Class {
	#name : #BrLayoutVerticalResizerRequest,
	#superclass : #BrLayoutResizerRequest,
	#category : #'Brick-! Core - Events'
}

{ #category : #initialization }
BrLayoutVerticalResizerRequest >> responseClass [
	^ BrLayoutVerticalResizerChanged
]
