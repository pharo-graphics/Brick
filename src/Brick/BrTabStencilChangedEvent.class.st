Class {
	#name : #BrTabStencilChangedEvent,
	#superclass : #BrTabEvent,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Tabs - Events'
}

{ #category : #accessing }
BrTabStencilChangedEvent >> stencil [
	^ stencil
]

{ #category : #accessing }
BrTabStencilChangedEvent >> stencil: anObject [
	stencil := anObject
]
