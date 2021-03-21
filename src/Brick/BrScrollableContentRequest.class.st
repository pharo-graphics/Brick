Class {
	#name : #BrScrollableContentRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Scrollable - Events'
}

{ #category : #initialization }
BrScrollableContentRequest >> responseClass [
	^ BrScrollableContentChanged
]
