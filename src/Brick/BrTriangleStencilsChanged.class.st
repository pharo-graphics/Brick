Class {
	#name : #BrTriangleStencilsChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'collapsedStencil',
		'expandedStencil'
	],
	#category : #'Brick-Triangle - Events'
}

{ #category : #accessing }
BrTriangleStencilsChanged >> collapsedStencil [
	^ collapsedStencil
]

{ #category : #accessing }
BrTriangleStencilsChanged >> collapsedStencil: anObject [
	collapsedStencil := anObject
]

{ #category : #accessing }
BrTriangleStencilsChanged >> expandedStencil [
	^ expandedStencil
]

{ #category : #accessing }
BrTriangleStencilsChanged >> expandedStencil: anObject [
	expandedStencil := anObject
]
