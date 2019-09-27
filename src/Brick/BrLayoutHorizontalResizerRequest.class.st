Class {
	#name : #BrLayoutHorizontalResizerRequest,
	#superclass : #BrLayoutResizerRequest,
	#category : #'Brick-Layout Resizer - Events'
}

{ #category : #initialization }
BrLayoutHorizontalResizerRequest >> responseClass [
	^ BrLayoutHorizontalResizerChanged
]
