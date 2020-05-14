Class {
	#name : #BrScrollbarThumbChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Scrollbar - Events'
}

{ #category : #accessing }
BrScrollbarThumbChanged >> stencil [
	^ stencil
]

{ #category : #accessing }
BrScrollbarThumbChanged >> stencil: anObject [
	stencil := anObject
]
