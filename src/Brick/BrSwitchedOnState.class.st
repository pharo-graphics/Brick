Class {
	#name : #BrSwitchedOnState,
	#superclass : #BrSwitchState,
	#category : #'Brick-Switch - States'
}

{ #category : #printing }
BrSwitchedOnState >> printOn: aStream [
	aStream nextPutAll: 'switched on'
]
