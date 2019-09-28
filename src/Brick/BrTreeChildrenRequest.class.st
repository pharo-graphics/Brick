Class {
	#name : #BrTreeChildrenRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Tree - Events'
}

{ #category : #initialization }
BrTreeChildrenRequest >> responseClass [
	^ BrTreeChildrenChanged
]
