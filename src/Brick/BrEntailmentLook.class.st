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
	self flag: 'FIXME is the still used?'.
	super initialize.
	changes
		add:
			(BrLookChange new
				up: [ :e | 	self updateWidget ];
				down: [ :e |  ];
				yourself).
]

{ #category : #initialization }
BrEntailmentLook >> initializeListeners [
	super initializeListeners.

]

{ #category : #initialization }
BrEntailmentLook >> initializeRequests [
	super initializeRequests.
	
]

{ #category : #updating }
BrEntailmentLook >> updateWidget [
	
]
