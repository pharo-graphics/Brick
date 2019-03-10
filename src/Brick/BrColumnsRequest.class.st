Class {
	#name : #BrColumnsRequest,
	#superclass : #BrRequest,
	#category : #'Brick-! Core - Events'
}

{ #category : #initialization }
BrColumnsRequest >> responseClass [
	^ BrColumnsChanged
]
