Class {
	#name : #BrDescriptionRequest,
	#superclass : #BrRequest,
	#category : #'Brick-! Core - Events'
}

{ #category : #initialization }
BrDescriptionRequest >> responseClass [
	^ BrDescriptionChanged
]
