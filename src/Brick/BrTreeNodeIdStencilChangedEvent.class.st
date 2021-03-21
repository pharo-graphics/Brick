Class {
	#name : #BrTreeNodeIdStencilChangedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'nodeIdStencil'
	],
	#category : #'Brick-Tree - Events'
}

{ #category : #accessing }
BrTreeNodeIdStencilChangedEvent >> nodeIdStencil [
	^ nodeIdStencil
]

{ #category : #accessing }
BrTreeNodeIdStencilChangedEvent >> nodeIdStencil: anObject [
	nodeIdStencil := anObject
]
