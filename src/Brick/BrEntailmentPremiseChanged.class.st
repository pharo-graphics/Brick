Class {
	#name : #BrEntailmentPremiseChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Entailment - Events'
}

{ #category : #accessing }
BrEntailmentPremiseChanged >> stencil [
	^ stencil
]

{ #category : #accessing }
BrEntailmentPremiseChanged >> stencil: anObject [
	stencil := anObject
]
