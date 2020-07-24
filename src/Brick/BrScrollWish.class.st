Class {
	#name : #BrScrollWish,
	#superclass : #BrWish,
	#instVars : [
		'smooth'
	],
	#category : #'Brick-Scrollable - Events'
}

{ #category : #initialization }
BrScrollWish >> initialize [
	super initialize.
	
	smooth := false
]

{ #category : #accessing }
BrScrollWish >> smooth [
	^ smooth
]

{ #category : #accessing }
BrScrollWish >> smooth: anObject [
	smooth := anObject
]
