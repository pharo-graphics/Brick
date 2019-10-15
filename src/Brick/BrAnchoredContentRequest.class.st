Class {
	#name : #BrAnchoredContentRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Anchored - Events'
}

{ #category : #initialization }
BrAnchoredContentRequest >> responseClass [
	self subclassResponsibility
]
