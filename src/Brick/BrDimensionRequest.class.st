Class {
	#name : #BrDimensionRequest,
	#superclass : #BrRequest,
	#category : #'Brick-! Core - Events'
}

{ #category : #initialization }
BrDimensionRequest >> responseClass [
	^ BrDimensionChanged
]
