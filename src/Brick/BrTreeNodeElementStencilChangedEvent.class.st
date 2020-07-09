Class {
	#name : #BrTreeNodeElementStencilChangedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'nodeElementStencil'
	],
	#category : #'Brick-Tree - Events'
}

{ #category : #accessing }
BrTreeNodeElementStencilChangedEvent >> nodeElementStencil [
	^ nodeElementStencil
]

{ #category : #accessing }
BrTreeNodeElementStencilChangedEvent >> nodeElementStencil: anObject [
	nodeElementStencil := anObject
]
