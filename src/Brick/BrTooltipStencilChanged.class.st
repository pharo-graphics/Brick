Class {
	#name : #BrTooltipStencilChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Tooltip - Events'
}

{ #category : #accessing }
BrTooltipStencilChanged >> stencil [
	^ stencil
]

{ #category : #accessing }
BrTooltipStencilChanged >> stencil: anObject [
	stencil := anObject
]
