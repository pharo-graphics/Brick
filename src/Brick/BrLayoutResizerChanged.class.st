Class {
	#name : #BrLayoutResizerChanged,
	#superclass : #BrStateChangedEvent,
	#instVars : [
		'resizer'
	],
	#category : #'Brick-Layout Resizer - Events'
}

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
