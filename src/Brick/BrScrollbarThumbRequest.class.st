Class {
	#name : #BrScrollbarThumbRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Scrollbar - Events'
}

{ #category : #initialization }
BrScrollbarThumbRequest >> responseClass [
	^ BrScrollbarThumbChanged
]
