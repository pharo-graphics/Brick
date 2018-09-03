"
I am sent by the look to request the state of the accordion model
"
Class {
	#name : #BrExpandedRequest,
	#superclass : #BrRequest,
	#category : #'Brick-! Core - Events'
}

{ #category : #initialization }
BrExpandedRequest >> responseClass [
	^ BrExpansionChanged
]
