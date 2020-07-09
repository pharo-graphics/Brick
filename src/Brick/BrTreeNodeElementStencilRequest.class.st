Class {
	#name : #BrTreeNodeElementStencilRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Tree - Events'
}

{ #category : #initialization }
BrTreeNodeElementStencilRequest >> responseClass [
	^ BrTreeNodeElementStencilChangedEvent
]
