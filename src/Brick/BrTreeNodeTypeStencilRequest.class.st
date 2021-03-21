Class {
	#name : #BrTreeNodeTypeStencilRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Tree - Events'
}

{ #category : #initialization }
BrTreeNodeTypeStencilRequest >> responseClass [
	^ BrTreeNodeTypeStencilChangedEvent
]
