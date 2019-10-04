Class {
	#name : #BrAnchoredAnchorChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'anchor'
	],
	#category : #'Brick-Anchored - Events'
}

{ #category : #accessing }
BrAnchoredAnchorChanged >> anchor [
	^ anchor
]

{ #category : #accessing }
BrAnchoredAnchorChanged >> anchor: anObject [
	anchor := anObject
]
