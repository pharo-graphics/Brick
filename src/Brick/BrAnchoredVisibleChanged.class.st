Class {
	#name : #BrAnchoredVisibleChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'visible'
	],
	#category : #'Brick-Anchored - Events'
}

{ #category : #accessing }
BrAnchoredVisibleChanged >> visible [
	^ visible
]

{ #category : #accessing }
BrAnchoredVisibleChanged >> visible: anObject [
	visible := anObject
]
