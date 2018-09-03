Class {
	#name : #BrInteractiveStyle,
	#superclass : #Object,
	#instVars : [
		'state',
		'action'
	],
	#category : #'Brick-! Core - Support'
}

{ #category : #accessing }
BrInteractiveStyle >> action [
	^ action
]

{ #category : #accessing }
BrInteractiveStyle >> action: anObject [
	action := anObject
]

{ #category : #accessing }
BrInteractiveStyle >> state [
	^ state
]

{ #category : #accessing }
BrInteractiveStyle >> state: anObject [
	state := anObject
]
