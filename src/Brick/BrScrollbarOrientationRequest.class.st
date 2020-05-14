Class {
	#name : #BrScrollbarOrientationRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Scrollbar - Events'
}

{ #category : #initialization }
BrScrollbarOrientationRequest >> responseClass [
	^ BrScrollbarOrientationChanged
]
