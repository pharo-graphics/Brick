Class {
	#name : #BrMaximizerMaximizeWish,
	#superclass : #BlEvent,
	#instVars : [
		'elementToMaximize',
		'preferredBackground'
	],
	#category : #'Brick-Maximizer - Event'
}

{ #category : #accessing }
BrMaximizerMaximizeWish >> elementToMaximize [
	^ elementToMaximize
]

{ #category : #accessing }
BrMaximizerMaximizeWish >> elementToMaximize: anObject [
	elementToMaximize := anObject
]

{ #category : #accessing }
BrMaximizerMaximizeWish >> preferredBackground [
	^ preferredBackground
]

{ #category : #accessing }
BrMaximizerMaximizeWish >> preferredBackground: anObject [
	preferredBackground := anObject
]
