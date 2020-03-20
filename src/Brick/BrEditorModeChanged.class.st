Class {
	#name : #BrEditorModeChanged,
	#superclass : #BrStateChangedEvent,
	#instVars : [
		'mode'
	],
	#category : #'Brick-Editor - Events'
}

{ #category : #accessing }
BrEditorModeChanged >> mode [
	^ mode
]

{ #category : #accessing }
BrEditorModeChanged >> mode: anObject [
	mode := anObject
]

{ #category : #accessing }
BrEditorModeChanged >> state: anObject [
	"Override me to properly set the given state"

	self mode: anObject
]
