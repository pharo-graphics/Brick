Class {
	#name : #BrSwitchedOffState,
	#superclass : #BrSwitchState,
	#category : #'Brick-Switch - States'
}

{ #category : #printing }
BrSwitchedOffState >> printOn: aStream [
	aStream nextPutAll: 'switched off'
]
