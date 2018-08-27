Class {
	#name : #BrPressedRequest,
	#superclass : #BrRequest,
	#category : #'Brick-! Core - Events'
}

{ #category : #initialization }
BrPressedRequest >> responseClass [
	^ BrPressedChanged
]
