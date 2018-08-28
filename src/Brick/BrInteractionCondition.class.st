Class {
	#name : #BrInteractionCondition,
	#superclass : #Object,
	#instVars : [
		'state',
		'action'
	],
	#category : #'Brick-! Core- Support'
}

{ #category : #accessing }
BrInteractionCondition >> action [
	^ action
]

{ #category : #accessing }
BrInteractionCondition >> action: anObject [
	action := anObject
]

{ #category : #accessing }
BrInteractionCondition >> state [
	^ state
]

{ #category : #accessing }
BrInteractionCondition >> state: anObject [
	state := anObject
]
