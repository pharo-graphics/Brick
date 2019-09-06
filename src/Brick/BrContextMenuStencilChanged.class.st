Class {
	#name : #BrContextMenuStencilChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Context Menu - Events'
}

{ #category : #accessing }
BrContextMenuStencilChanged >> stencil [
	^ stencil
]

{ #category : #accessing }
BrContextMenuStencilChanged >> stencil: anObject [
	stencil := anObject
]
