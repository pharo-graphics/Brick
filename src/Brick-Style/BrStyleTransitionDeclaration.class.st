Class {
	#name : #BrStyleTransitionDeclaration,
	#superclass : #BrStyleDeclaration,
	#instVars : [
		'duration',
		'timingFunction',
		'delay'
	],
	#category : 'Brick-Style-CSS'
}

{ #category : #'adding/removing' }
BrStyleTransitionDeclaration >> addTo: aRule [
	aRule transitions add: self
]

{ #category : #accessing }
BrStyleTransitionDeclaration >> delay [
	^ delay
]

{ #category : #accessing }
BrStyleTransitionDeclaration >> delay: anObject [
	delay := anObject
]

{ #category : #accessing }
BrStyleTransitionDeclaration >> duration [
	^ duration
]

{ #category : #accessing }
BrStyleTransitionDeclaration >> duration: anObject [
	duration := anObject
]

{ #category : #'initialize-release' }
BrStyleTransitionDeclaration >> initialize [
	super initialize.
	duration := 0.
	timingFunction := #linear.
	delay := 0.
]

{ #category : #accessing }
BrStyleTransitionDeclaration >> timingFunction [
	^ timingFunction
]

{ #category : #accessing }
BrStyleTransitionDeclaration >> timingFunction: anObject [
	timingFunction := anObject
]

{ #category : #importing }
BrStyleTransitionDeclaration >> valuesFromArray: anArray [
	self duration: (anArray at: 1 ifAbsent: [ ^ self duration ]) value.
	self timingFunction: (anArray at: 2 ifAbsent: [ ^ self timingFunction ]) value.
	self delay: (anArray at: 3 ifAbsent: [ ^ self delay ]) value
]
