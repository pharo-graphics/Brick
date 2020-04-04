"
I am sent by a look to request the activation status (enabled/disabled) of the widget model
"
Class {
	#name : #BrEnablementRequest,
	#superclass : #BrRequest,
	#category : #'Brick-! Core - Events'
}

{ #category : #initialization }
BrEnablementRequest >> responseClass [
	^ BrEnablementChanged
]
