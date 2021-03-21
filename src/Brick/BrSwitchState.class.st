Class {
	#name : #BrSwitchState,
	#superclass : #BrInteractionState,
	#category : #'Brick-Switch - States'
}

{ #category : #'instance creation' }
BrSwitchState class >> switchedOff [
	^ BrSwitchedOffState new
]

{ #category : #'instance creation' }
BrSwitchState class >> switchedOn [
	^ BrSwitchedOnState new
]
