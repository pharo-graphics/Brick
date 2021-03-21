Class {
	#name : #BrAnchoredWish,
	#superclass : #BrWish,
	#instVars : [
		'anchor'
	],
	#category : #'Brick-Anchored - Events'
}

{ #category : #accessing }
BrAnchoredWish >> anchor [
	^ anchor
]

{ #category : #accessing }
BrAnchoredWish >> anchor: anObject [
	anchor := anObject
]
