Class {
	#name : #BrImmediateTreeNode,
	#superclass : #BrTreeNode,
	#category : #'Brick-Tree - Model'
}

{ #category : #initialization }
BrImmediateTreeNode >> newSubNode: anObject computation: aComputationBlock [
	^ self class new value: anObject computation: aComputationBlock
]

{ #category : #initialization }
BrImmediateTreeNode >> value: anObject computation: aComputationBlock withSelf: shouldAccountForSelf [
	super value: anObject computation: aComputationBlock withSelf: shouldAccountForSelf.
	
	self ensureChildrenNodes
]
