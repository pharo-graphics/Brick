Class {
	#name : #BrMaximizerMaximizeWish,
	#superclass : #BlEvent,
	#instVars : [
		'maximizerLook',
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
BrMaximizerMaximizeWish >> maximizerAptitude [
	^ maximizerLook
]

{ #category : #accessing }
BrMaximizerMaximizeWish >> maximizerAptitude: anObject [
	maximizerLook := anObject
]

{ #category : #accessing }
BrMaximizerMaximizeWish >> preferredBackground [
	^ preferredBackground
]

{ #category : #accessing }
BrMaximizerMaximizeWish >> preferredBackground: anObject [
	preferredBackground := anObject
]
