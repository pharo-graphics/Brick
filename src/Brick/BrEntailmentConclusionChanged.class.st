Class {
	#name : #BrEntailmentConclusionChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Entailment - Events'
}

{ #category : #accessing }
BrEntailmentConclusionChanged >> stencil [
	^ stencil
]

{ #category : #accessing }
BrEntailmentConclusionChanged >> stencil: anObject [
	stencil := anObject
]
