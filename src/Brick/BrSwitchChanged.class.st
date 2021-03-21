Class {
	#name : #BrSwitchChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'switchedOn'
	],
	#category : #'Brick-Switch - Events'
}

{ #category : #'instance creation' }
BrSwitchChanged class >> switchedOn: aBoolean [
	^ self new switchedOn: aBoolean
]

{ #category : #initialization }
BrSwitchChanged >> initialize [
	super initialize.
	
	switchedOn := false
]

{ #category : #testing }
BrSwitchChanged >> isOff [
	<return: #Boolean>

	^ switchedOn not
]

{ #category : #testing }
BrSwitchChanged >> isOn [
	<return: #Boolean>

	^ switchedOn
]

{ #category : #initialization }
BrSwitchChanged >> switchedOn: aBoolean [
	switchedOn := aBoolean
]
