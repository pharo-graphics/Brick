Class {
	#name : #BrEntailmentAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'example'
	],
	#category : #'Brick-Entailment - Look'
}

{ #category : #initialization }
BrEntailmentAptitude >> initialize [
	self flag: 'FIXME is the still used?'.
	super initialize.
	self
		addChange:
			(BrLookChange new
				up: [ :e | self updateWidget ];
				down: [ :e |  ];
				yourself)
]

{ #category : #initialization }
BrEntailmentAptitude >> initializeListeners [
	super initializeListeners.

]

{ #category : #initialization }
BrEntailmentAptitude >> initializeRequests [
	super initializeRequests.
	
]

{ #category : #updating }
BrEntailmentAptitude >> updateWidget [
	
]
