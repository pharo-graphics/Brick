Class {
	#name : #BrScrollToItemWish,
	#superclass : #BrScrollWish,
	#instVars : [
		'index'
	],
	#category : #'Brick-Scrollable - Events'
}

{ #category : #accessing }
BrScrollToItemWish >> index [
	^ index
]

{ #category : #accessing }
BrScrollToItemWish >> index: anObject [
	index := anObject
]
