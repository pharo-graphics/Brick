Class {
	#name : #BrAnchoredStencilChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Anchored - Events'
}

{ #category : #accessing }
BrAnchoredStencilChanged >> stencil [
	^ stencil
]

{ #category : #accessing }
BrAnchoredStencilChanged >> stencil: anObject [
	stencil := anObject
]
