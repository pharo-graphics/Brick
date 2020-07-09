Class {
	#name : #BrTreeNodeDataBinderRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Tree - Events'
}

{ #category : #initialization }
BrTreeNodeDataBinderRequest >> responseClass [
	^ BrTreeNodeDataBinderChangedEvent
]
