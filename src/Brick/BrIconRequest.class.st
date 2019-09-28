"
I am sent by a look to request icon update from the view model
"
Class {
	#name : #BrIconRequest,
	#superclass : #BrRequest,
	#category : 'Brick-! Core - Events'
}

{ #category : #initialization }
BrIconRequest >> responseClass [
	^ BrIconChanged
]
