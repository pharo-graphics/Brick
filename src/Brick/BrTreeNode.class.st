Class {
	#name : #BrTreeNode,
	#superclass : #Object,
	#category : #'Brick-Tree - Model'
}

{ #category : #accessing }
BrTreeNode >> at: anIndex [
	<return: #BrLazyTreeNode>

	^ self subclassResponsibility
]
