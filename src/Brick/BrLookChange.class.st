Class {
	#name : #BrLookChange,
	#superclass : #Object,
	#instVars : [
		'initialized',
		'old',
		'new',
		'read',
		'up',
		'down'
	],
	#category : #'Brick-! Core'
}

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
	| current |
	self assert: [ initialized ].
	current := read value: aLook.
	current ~~ old
		ifTrue: [ down value: aLook value: old value: new ].
	old := nil.
	new := nil.
	initialized := false
]

{ #category : #initialization }
BrLookChange >> initialize [
	super initialize.
	initialized := false.
	read := [ :e |  ].
	up := [ :e :f |  ].
	down := [ :e :f :g |  ]
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
BrLookChange >> new [
	^ new
]

{ #category : #accessing }
BrLookChange >> new: anObject [
	new := anObject
]

{ #category : #accessing }
BrLookChange >> old [
	^ old
]

{ #category : #accessing }
BrLookChange >> old: anObject [
	old := anObject
]

{ #category : #accessing }
BrLookChange >> read [
	^ read
]

{ #category : #accessing }
BrLookChange >> read: anObject [
	read := anObject
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
	old := read value: aLook.
	up value: aLook value: old.
	new := read value: aLook.
	initialized := true
]
