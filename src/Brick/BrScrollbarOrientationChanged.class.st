Class {
	#name : #BrScrollbarOrientationChanged,
	#superclass : #BrStateChangedEvent,
	#instVars : [
		'orientation'
	],
	#category : #'Brick-Scrollbar - Events'
}

{ #category : #accessing }
BrScrollbarOrientationChanged >> orientation [
	^ orientation
]

{ #category : #accessing }
BrScrollbarOrientationChanged >> orientation: anObject [
	orientation := anObject
]

{ #category : #accessing }
BrScrollbarOrientationChanged >> state: anObject [
	"Override me to properly set the given state"

	self orientation: anObject
]
