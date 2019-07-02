Class {
	#name : #BrLayoutAlignmentChanged,
	#superclass : #BrStateChangedEvent,
	#instVars : [
		'alignment'
	],
	#category : #'Brick-Layout Alignment - Events'
}

{ #category : #accessing }
BrLayoutAlignmentChanged >> alignment [
	^ alignment
]

{ #category : #accessing }
BrLayoutAlignmentChanged >> alignment: anObject [
	alignment := anObject
]

{ #category : #accessing }
BrLayoutAlignmentChanged >> state: anObject [
	"Override me to properly set the given state"

	self alignment: anObject
]
