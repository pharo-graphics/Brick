"
I am sent by a look to request label text update  from the view mod
"
Class {
	#name : #BrLabelRequest,
	#superclass : #BrRequest,
	#category : 'Brick-! Core - Events'
}

{ #category : #initialization }
BrLabelRequest >> responseClass [
	^ BrLabelChanged
]
