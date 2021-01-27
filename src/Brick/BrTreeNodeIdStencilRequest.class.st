Class {
	#name : #BrTreeNodeIdStencilRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Tree - Events'
}

{ #category : #initialization }
BrTreeNodeIdStencilRequest >> responseClass [
	^ BrTreeNodeIdStencilChangedEvent
]
