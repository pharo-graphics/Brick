"
I am sent when the activation status (enabled / disabled) of the widget is changed
"
Class {
	#name : #BrActivationChanged,
	#superclass : #BrStateChangedEvent,
	#instVars : [
		'enabled'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #'instance creation' }
BrActivationChanged class >> enabled: aBoolean [
	^ self new enabled: aBoolean
]

{ #category : #accessing }
BrActivationChanged >> enabled [
	<return: #Boolean>

	^ enabled
]

{ #category : #accessing }
BrActivationChanged >> enabled: aBoolean [
	enabled := aBoolean
]

{ #category : #initialization }
BrActivationChanged >> initialize [
	super initialize.
	
	enabled := true
]

{ #category : #testing }
BrActivationChanged >> isActivated [
	^ self enabled
]

{ #category : #accessing }
BrActivationChanged >> state: anObject [
	"Override me to properly set the given state"

	self enabled: anObject
]
