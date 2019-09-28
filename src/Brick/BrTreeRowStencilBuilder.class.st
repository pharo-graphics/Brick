Class {
	#name : #BrTreeRowStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'rowIndex',
		'treeElement',
		'treeNode'
	],
	#category : #'Brick-Tree - Stencil'
}

{ #category : #'api - instantiation' }
BrTreeRowStencilBuilder >> paramsOn: aStencilExecutor [

	aStencilExecutor
		push: self treeNode;
		push: self rowIndex;
		push: self treeElement
]

{ #category : #accessing }
BrTreeRowStencilBuilder >> rowIndex [
	<return: #Number>

	^ rowIndex
]

{ #category : #accessing }
BrTreeRowStencilBuilder >> rowIndex: aNumber [
	rowIndex := aNumber
]

{ #category : #accessing }
BrTreeRowStencilBuilder >> treeElement [
	^ treeElement
]

{ #category : #accessing }
BrTreeRowStencilBuilder >> treeElement: anObject [
	treeElement := anObject
]

{ #category : #accessing }
BrTreeRowStencilBuilder >> treeNode [
	<return: #BrTreeNode>

	^ treeNode
]

{ #category : #accessing }
BrTreeRowStencilBuilder >> treeNode: aTreeNode [
	treeNode := aTreeNode
]
