Class {
	#name : #BrTreeNodeTypeStencilChangedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'nodeTypeStencil'
	],
	#category : #'Brick-Tree - Events'
}

{ #category : #accessing }
BrTreeNodeTypeStencilChangedEvent >> nodeTypeStencil [
	^ nodeTypeStencil
]

{ #category : #accessing }
BrTreeNodeTypeStencilChangedEvent >> nodeTypeStencil: anObject [
	nodeTypeStencil := anObject
]
