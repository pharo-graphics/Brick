Class {
	#name : #BrSwitchRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Switch - Events'
}

{ #category : #initialization }
BrSwitchRequest >> responseClass [
	^ BrSwitchChanged
]
