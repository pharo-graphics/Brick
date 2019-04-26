Class {
	#name : #BrColumnsRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Column - Events'
}

{ #category : #initialization }
BrColumnsRequest >> responseClass [
	^ BrColumnsChanged
]
