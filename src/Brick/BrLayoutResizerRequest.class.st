Class {
	#name : #BrLayoutResizerRequest,
	#superclass : #BrRequest,
	#category : #'Brick-! Core - Events'
}

{ #category : #initialization }
BrLayoutResizerRequest >> responseClass [
	^ self subclassResponsibility
]
