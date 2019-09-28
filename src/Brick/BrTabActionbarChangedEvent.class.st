Class {
	#name : #BrTabActionbarChangedEvent,
	#superclass : #BrTabEvent,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Tabs - Events'
}

{ #category : #accessing }
BrTabActionbarChangedEvent >> stencil [
	^ stencil
]

{ #category : #accessing }
BrTabActionbarChangedEvent >> stencil: anObject [
	stencil := anObject
]
