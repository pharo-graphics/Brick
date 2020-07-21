Class {
	#name : #BrScrollableContentChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'contentStencil'
	],
	#category : #'Brick-Scrollable - Events'
}

{ #category : #accessing }
BrScrollableContentChanged >> contentStencil [
	^ contentStencil
]

{ #category : #accessing }
BrScrollableContentChanged >> contentStencil: anObject [
	contentStencil := anObject
]
