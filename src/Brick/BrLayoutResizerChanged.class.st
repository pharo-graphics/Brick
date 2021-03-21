Class {
	#name : #BrLayoutResizerChanged,
	#superclass : #BrStateChangedEvent,
	#instVars : [
		'resizer'
	],
	#category : #'Brick-! Deprecated'
}

{ #category : #testing }
BrLayoutResizerChanged class >> isDeprecated [
	^ true
]

{ #category : #accessing }
BrLayoutResizerChanged >> resizer [
	^ resizer
]

{ #category : #accessing }
BrLayoutResizerChanged >> resizer: anObject [
	resizer := anObject
]

{ #category : #accessing }
BrLayoutResizerChanged >> state: anObject [
	"Override me to properly set the given state"

	self resizer: anObject
]
