Class {
	#name : #BrInteractionChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'states',
		'forceUpdate'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #accessing }
BrInteractionChanged >> forceUpdate [
	^ forceUpdate
]

{ #category : #accessing }
BrInteractionChanged >> forceUpdate: anObject [
	forceUpdate := anObject
]

{ #category : #initialization }
BrInteractionChanged >> initialize [
	super initialize.
	
	states := Set new.
	forceUpdate := false
]

{ #category : #accessing }
BrInteractionChanged >> states [
	^ states
]

{ #category : #accessing }
BrInteractionChanged >> states: anObject [
	states := anObject
]
