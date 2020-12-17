Class {
	#name : #BrResponse,
	#superclass : #BlEvent,
	#category : #'Brick-Core-Events'
}

{ #category : #initialization }
BrResponse >> reply: anObject [
	self subclassResponsibility
]
