Class {
	#name : #BrScrollByWish,
	#superclass : #BrScrollWish,
	#instVars : [
		'delta'
	],
	#category : #'Brick-Scrollable - Events'
}

{ #category : #accessing }
BrScrollByWish >> delta [
	^ delta
]

{ #category : #accessing }
BrScrollByWish >> delta: anObject [
	delta := anObject
]
