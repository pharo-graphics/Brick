Class {
	#name : #BrHoveredRequest,
	#superclass : #BrRequest,
	#category : #'Brick-! Core - Events'
}

{ #category : #initialization }
BrHoveredRequest >> responseClass [
	^ BrHoveredChanged
]
