Class {
	#name : #BrAnchoredContentChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'content'
	],
	#category : #'Brick-Anchored - Events'
}

{ #category : #accessing }
BrAnchoredContentChanged >> content [
	^ content
]

{ #category : #accessing }
BrAnchoredContentChanged >> content: anObject [
	content := anObject
]
