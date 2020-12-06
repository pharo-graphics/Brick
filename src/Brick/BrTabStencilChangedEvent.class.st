Class {
	#name : #BrTabStencilChangedEvent,
	#superclass : #BrTabEvent,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Tabs - Events'
}

{ #category : #sending }
BrTabStencilChangedEvent >> sendTo: anObject [
	anObject tabStencilChanged: self
]

{ #category : #accessing }
BrTabStencilChangedEvent >> stencil [
	^ stencil
]

{ #category : #accessing }
BrTabStencilChangedEvent >> stencil: anObject [
	stencil := anObject
]
