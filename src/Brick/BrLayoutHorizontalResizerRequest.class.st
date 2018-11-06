Class {
	#name : #BrLayoutHorizontalResizerRequest,
	#superclass : #BrLayoutResizerRequest,
	#category : #'Brick-! Core - Events'
}

{ #category : #initialization }
BrLayoutHorizontalResizerRequest >> responseClass [
	^ BrLayoutHorizontalResizerChanged
]
