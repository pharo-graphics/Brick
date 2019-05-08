Class {
	#name : #BrLookChange,
	#superclass : #Object,
	#instVars : [
		'initialized',
		'up',
		'down'
	],
	#category : #'Brick-! Core'
}

{ #category : #converting }
BrLookChange >> asElementFor: aLook [
	^ BrButton new
		look: BrGlamorousButtonWithLabelLook;
		label:
			(initialized
				ifTrue: [ 'Down ' , self class name ]
				ifFalse: [ 'Up ' , self class name ]);
		action: [ :e | 
			initialized
				ifTrue: [ self downOn: aLook.
					e label: 'Up ' , self class name ]
				ifFalse: [ self upOn: aLook.
					e label: 'Down ' , self class name ] ];
		yourself
]

{ #category : #accessing }
BrLookChange >> down [
	^ down
]

{ #category : #accessing }
BrLookChange >> down: anObject [
	down := anObject
]

{ #category : #initialization }
BrLookChange >> downOn: aLook [
	self assert: [ initialized ].
	down value: aLook.
	initialized := false
]

{ #category : #initialization }
BrLookChange >> initialize [
	super initialize.
	initialized := false.
	up := [ :e |  ].
	down := [ :e |  ]
]

{ #category : #accessing }
BrLookChange >> initialized [
	^ initialized
]

{ #category : #accessing }
BrLookChange >> initialized: anObject [
	initialized := anObject
]

{ #category : #accessing }
BrLookChange >> up [
	^ up
]

{ #category : #accessing }
BrLookChange >> up: anObject [
	up := anObject
]

{ #category : #initialization }
BrLookChange >> upOn: aLook [
	self assert: [ initialized not ].
	up value: aLook.
	initialized := true
]
