Class {
	#name : #BrLazyTreeNode,
	#superclass : #BrTreeNode,
	#category : #'Brick-Tree - Model'
}

{ #category : #initialization }
BrLazyTreeNode >> newSubNode: anObject computation: aComputationBlock [
	^ self class new value: anObject computation: aComputationBlock
]
