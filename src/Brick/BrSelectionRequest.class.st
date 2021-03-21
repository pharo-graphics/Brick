"
I am sent by a look to request selection update from the view model
"
Class {
	#name : #BrSelectionRequest,
	#superclass : #BrRequest,
	#category : #'Brick-! Core - Events'
}

{ #category : #initialization }
BrSelectionRequest >> responseClass [
	^ BrSelectionChanged
]
