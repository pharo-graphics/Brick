Class {
	#name : #BrAnchoredRelocateWish,
	#superclass : #BrWish,
	#instVars : [
		'anchor',
		'anchored'
	],
	#category : #'Brick-Anchored - Events'
}

{ #category : #'as yet unclassified' }
BrAnchoredRelocateWish class >> anchor: anElement container: anotherElement [
	^ self new
		anchor: anElement;
		container: anotherElement;
		yourself
]

{ #category : #accessing }
BrAnchoredRelocateWish >> anchor [
	^ anchor
]

{ #category : #accessing }
BrAnchoredRelocateWish >> anchor: anObject [
	anchor := anObject
]

{ #category : #accessing }
BrAnchoredRelocateWish >> anchored [
	^ anchored
]

{ #category : #accessing }
BrAnchoredRelocateWish >> anchored: anObject [
	anchored := anObject
]

{ #category : #converting }
BrAnchoredRelocateWish >> asRelocation [
	self subclassResponsibility
]
