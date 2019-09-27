Class {
	#name : #BrInteractionChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'states'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #initialization }
BrInteractionChanged >> initialize [
	super initialize.
	
	states := Set new
]

{ #category : #accessing }
BrInteractionChanged >> states [
	^ states
]

{ #category : #accessing }
BrInteractionChanged >> states: anObject [
	states := anObject
]
