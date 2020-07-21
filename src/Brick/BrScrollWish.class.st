Class {
	#name : #BrScrollWish,
	#superclass : #BrWish,
	#instVars : [
		'smooth'
	],
	#category : #'Brick-Scrollable - Events'
}

{ #category : #accessing }
BrScrollWish >> smooth [
	^ smooth
]

{ #category : #accessing }
BrScrollWish >> smooth: anObject [
	smooth := anObject
]
