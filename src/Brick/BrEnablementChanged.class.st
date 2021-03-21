"
I am sent when the activation status (enabled / disabled) of the widget is changed
"
Class {
	#name : #BrEnablementChanged,
	#superclass : #BrStateChangedEvent,
	#instVars : [
		'enabled'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #'instance creation' }
BrEnablementChanged class >> enabled: aBoolean [
	^ self new enabled: aBoolean
]

{ #category : #accessing }
BrEnablementChanged >> enabled [
	<return: #Boolean>

	^ enabled
]

{ #category : #accessing }
BrEnablementChanged >> enabled: aBoolean [
	enabled := aBoolean
]

{ #category : #initialization }
BrEnablementChanged >> initialize [
	super initialize.
	
	enabled := true
]

{ #category : #testing }
BrEnablementChanged >> isActivated [
	^ self isEnabled
]

{ #category : #testing }
BrEnablementChanged >> isEnabled [
	^ self enabled
]

{ #category : #accessing }
BrEnablementChanged >> state: anObject [
	"Override me to properly set the given state"

	self enabled: anObject
]
