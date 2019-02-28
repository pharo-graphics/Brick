Class {
	#name : #BrSelectedStateRequest,
	#superclass : #BrRequest,
	#category : #'Brick-! Core - Events'
}

{ #category : #initialization }
BrSelectedStateRequest >> responseClass [
	^ BrSelectedChanged
]
