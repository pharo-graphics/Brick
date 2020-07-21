Class {
	#name : #BrScrollToWish,
	#superclass : #BrScrollWish,
	#instVars : [
		'position'
	],
	#category : #'Brick-Scrollable - Events'
}

{ #category : #accessing }
BrScrollToWish >> position [
	^ position
]

{ #category : #accessing }
BrScrollToWish >> position: anObject [
	position := anObject
]
