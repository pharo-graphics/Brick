Class {
	#name : #BrSwitchAptitude,
	#superclass : #BrInteractiveAptitude,
	#category : #'Brick-Switch - Look'
}

{ #category : #accessing }
BrSwitchAptitude >> state [
	^ BrSwitchState
]

{ #category : #'api - style' }
BrSwitchAptitude >> switchedOff: aBlock [
	self
		when: self state switchedOff
		style: aBlock
]

{ #category : #'api - style' }
BrSwitchAptitude >> switchedOn: aBlock [
	self
		when: self state switchedOn
		style: aBlock
]
