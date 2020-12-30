Class {
	#name : #BrToggleAddedEvent,
	#superclass : #BrToggleEvent,
	#instVars : [
		'index'
	],
	#category : #'Brick-Toggle - Events'
}

{ #category : #accessing }
BrToggleAddedEvent >> index [
	^ index
]

{ #category : #accessing }
BrToggleAddedEvent >> index: anObject [
	index := anObject
]
