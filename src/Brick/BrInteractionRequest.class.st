Class {
	#name : #BrInteractionRequest,
	#superclass : #BrRequest,
	#instVars : [
		'forceUpdate'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #accessing }
BrInteractionRequest >> forceUpdate [
	^ forceUpdate
]

{ #category : #accessing }
BrInteractionRequest >> forceUpdate: anObject [
	forceUpdate := anObject
]

{ #category : #initialization }
BrInteractionRequest >> initialize [
	super initialize.
	
	forceUpdate := false
]

{ #category : #initialization }
BrInteractionRequest >> responseClass [
	^ BrInteractionChanged
]
