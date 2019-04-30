Class {
	#name : #BrEntailmentLook,
	#superclass : #BrLook,
	#instVars : [
		'example'
	],
	#category : #'Brick-Entailment - Look'
}

{ #category : #initialization }
BrEntailmentLook >> initialize [
	super initialize.
]

{ #category : #initialization }
BrEntailmentLook >> initializeListeners [
	super initializeListeners.

]

{ #category : #initialization }
BrEntailmentLook >> initializeLook [
	self flag: 'FIXME is the still used?'.
	super initializeLook.
	
	self updateWidget
]

{ #category : #initialization }
BrEntailmentLook >> initializeRequests [
	super initializeRequests.
	
]

{ #category : #updating }
BrEntailmentLook >> updateWidget [
	
]
