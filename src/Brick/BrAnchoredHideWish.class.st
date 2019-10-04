Class {
	#name : #BrAnchoredHideWish,
	#superclass : #BrWish,
	#instVars : [
		'anchor',
		'anchored'
	],
	#category : #'Brick-Anchored - Events'
}

{ #category : #accessing }
BrAnchoredHideWish >> anchor [
	^ anchor
]

{ #category : #accessing }
BrAnchoredHideWish >> anchor: anObject [
	anchor := anObject
]

{ #category : #accessing }
BrAnchoredHideWish >> anchored [
	^ anchored
]

{ #category : #accessing }
BrAnchoredHideWish >> anchored: anObject [
	anchored := anObject
]
