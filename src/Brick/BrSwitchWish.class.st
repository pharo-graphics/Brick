Class {
	#name : #BrSwitchWish,
	#superclass : #BrWish,
	#instVars : [
		'switchedOn'
	],
	#category : #'Brick-Switch - Events'
}

{ #category : #'instance creation' }
BrSwitchWish class >> switchedOn: aBoolean [
	^ self new switchedOn: aBoolean
]

{ #category : #initialization }
BrSwitchWish >> initialize [
	super initialize.
	
	switchedOn := false
]

{ #category : #testing }
BrSwitchWish >> isOff [
	^ switchedOn not
]

{ #category : #testing }
BrSwitchWish >> isOn [
	^ switchedOn
]

{ #category : #initialization }
BrSwitchWish >> switchedOn: anObject [
	switchedOn := anObject
]
