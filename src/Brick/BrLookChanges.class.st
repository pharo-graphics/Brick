Class {
	#name : #BrLookChanges,
	#superclass : #Object,
	#instVars : [
		'initialized',
		'changes'
	],
	#category : #'Brick-! Core'
}

{ #category : #adding }
BrLookChanges >> add: aChange [
	changes add: aChange
]

{ #category : #converting }
BrLookChanges >> asElementFor: aLook [
	^ BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		addChildren: (changes collect: [ :e | e asElementFor: aLook ]);
		yourself
]

{ #category : #initialization }
BrLookChanges >> downOn: aLook [
	self assert: [ initialized ].
	changes reversed do: [ :e | e downOn: aLook ].
	initialized := false
]

{ #category : #initialization }
BrLookChanges >> initialize [
	super initialize.
	initialized := false.
	changes := OrderedCollection new
]

{ #category : #initialization }
BrLookChanges >> upOn: aLook [
	self assert: [ initialized not ].
	changes do: [ :e | e upOn: aLook ].
	initialized := true
]
