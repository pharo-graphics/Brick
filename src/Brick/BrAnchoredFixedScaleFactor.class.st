Class {
	#name : #BrAnchoredFixedScaleFactor,
	#superclass : #BrAnchoredScaleFactor,
	#instVars : [
		'factor'
	],
	#category : #'Brick-Anchored - Support'
}

{ #category : #converting }
BrAnchoredFixedScaleFactor class >> asBrAnchoredScaleFactor [
	^ self factor: 1
]

{ #category : #'instance creation' }
BrAnchoredFixedScaleFactor class >> factor: aNumber [
	^ self new
		initializeFactor: aNumber;
		yourself
]

{ #category : #'as yet unclassified' }
BrAnchoredFixedScaleFactor >> factorIn: aReferenceElement [
	^ factor
]

{ #category : #initialization }
BrAnchoredFixedScaleFactor >> initializeFactor: aNumber [
	self assert: [ factor isNil ].
	factor := aNumber
]
