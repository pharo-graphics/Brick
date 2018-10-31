Class {
	#name : #BrResizerTargetChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'targetElement'
	],
	#category : #'Brick-Resizer - Events'
}

{ #category : #accessing }
BrResizerTargetChanged >> targetElement [
	^ targetElement
]

{ #category : #accessing }
BrResizerTargetChanged >> targetElement: anObject [
	targetElement := anObject
]
