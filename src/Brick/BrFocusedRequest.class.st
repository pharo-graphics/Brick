Class {
	#name : #BrFocusedRequest,
	#superclass : #BrRequest,
	#category : #'Brick-! Core - Events'
}

{ #category : #initialization }
BrFocusedRequest >> responseClass [
	^ BrFocusedChanged
]
