Class {
	#name : #BrTreeRowElementStencilRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Tree - Events'
}

{ #category : #initialization }
BrTreeRowElementStencilRequest >> responseClass [
	^ BrTreeRowElementStencilChangedEvent
]
