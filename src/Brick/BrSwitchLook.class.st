Class {
	#name : #BrSwitchLook,
	#superclass : #BrInteractiveLook,
	#category : #'Brick-Switch - Look'
}

{ #category : #accessing }
BrSwitchLook >> state [
	^ BrSwitchState
]

{ #category : #'api - style' }
BrSwitchLook >> switchedOff: aBlock [
	self
		when: self state switchedOff
		style: aBlock
]

{ #category : #'api - style' }
BrSwitchLook >> switchedOn: aBlock [
	self
		when: self state switchedOn
		style: aBlock
]
