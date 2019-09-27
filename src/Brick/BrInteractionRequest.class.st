Class {
	#name : #BrInteractionRequest,
	#superclass : #BrRequest,
	#category : #'Brick-! Core - Events'
}

{ #category : #initialization }
BrInteractionRequest >> responseClass [
	^ BrInteractionChanged
]
