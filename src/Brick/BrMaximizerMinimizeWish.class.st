Class {
	#name : #BrMaximizerMinimizeWish,
	#superclass : #BlEvent,
	#instVars : [
		'elementToMinimize',
		'hostElement'
	],
	#category : #'Brick-Maximizer - Event'
}

{ #category : #accessing }
BrMaximizerMinimizeWish >> elementToMinimize [
	^ elementToMinimize
]

{ #category : #accessing }
BrMaximizerMinimizeWish >> elementToMinimize: anObject [
	elementToMinimize := anObject
]

{ #category : #accessing }
BrMaximizerMinimizeWish >> hostElement [
	^ hostElement
]

{ #category : #accessing }
BrMaximizerMinimizeWish >> hostElement: anObject [
	hostElement := anObject
]
