Class {
	#name : #BrEnablementWish,
	#superclass : #BrWish,
	#instVars : [
		'enabled'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #'instance creation' }
BrEnablementWish class >> activated: aBoolean [
	^ self new activated: aBoolean
]

{ #category : #'instance creation' }
BrEnablementWish class >> enabled: aBoolean [
	^ self new enabled: aBoolean
]

{ #category : #accessing }
BrEnablementWish >> activated [
	^ enabled
]

{ #category : #accessing }
BrEnablementWish >> activated: anObject [
	enabled := anObject
]

{ #category : #accessing }
BrEnablementWish >> enabled [
	^ enabled
]

{ #category : #accessing }
BrEnablementWish >> enabled: aBoolean [
	enabled := aBoolean
]

{ #category : #initialization }
BrEnablementWish >> initialize [
	super initialize.
	
	enabled := false
]

{ #category : #testing }
BrEnablementWish >> isActivated [
	^ enabled
]

{ #category : #testing }
BrEnablementWish >> isEnabled [
	^ enabled
]
