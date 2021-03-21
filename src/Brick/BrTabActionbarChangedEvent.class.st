Class {
	#name : #BrTabActionbarChangedEvent,
	#superclass : #BrTabEvent,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Tabs - Events'
}

{ #category : #sending }
BrTabActionbarChangedEvent >> sendTo: anObject [
	anObject tabActionbarChanged: self
]

{ #category : #accessing }
BrTabActionbarChangedEvent >> stencil [
	^ stencil
]

{ #category : #accessing }
BrTabActionbarChangedEvent >> stencil: anObject [
	stencil := anObject
]
