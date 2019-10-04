Class {
	#name : #BrAnchoredHandleRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Anchored - Events'
}

{ #category : #initialization }
BrAnchoredHandleRequest >> responseClass [
	self subclassResponsibility
]
