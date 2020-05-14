Class {
	#name : #BrScrollbarScrollableRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Scrollbar - Events'
}

{ #category : #initialization }
BrScrollbarScrollableRequest >> responseClass [
	^ BrScrollbarScrollableChanged
]
