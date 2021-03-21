"
I define the api of an object that should bind the actual node data to the reused node element
"
Class {
	#name : #BrTreeNodeDataBinder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'nodeElement',
		'itemObject',
		'treeNode',
		'payloads'
	],
	#category : #'Brick-Tree - Stencil'
}

{ #category : #'api - instantiation' }
BrTreeNodeDataBinder >> buildDefault [
	<return: #BrStencil or: #BlElement>
	
	^ nil
]

{ #category : #accessing }
BrTreeNodeDataBinder >> itemObject [
	<return: #Object>

	^ itemObject
]

{ #category : #accessing }
BrTreeNodeDataBinder >> itemObject: anObject [
	itemObject := anObject
]

{ #category : #accessing }
BrTreeNodeDataBinder >> nodeElement [
	<return: #BlElement>

	^ nodeElement
]

{ #category : #accessing }
BrTreeNodeDataBinder >> nodeElement: anElement [
	nodeElement := anElement
]

{ #category : #'api - instantiation' }
BrTreeNodeDataBinder >> paramsOn: aStencilExecutor [
	aStencilExecutor
		push: self nodeElement;
		push: self itemObject;
		push: self treeNode;
		push: self payloads
]

{ #category : #accessing }
BrTreeNodeDataBinder >> payloads [
	^ payloads
]

{ #category : #accessing }
BrTreeNodeDataBinder >> payloads: anObject [
	payloads := anObject
]

{ #category : #initialization }
BrTreeNodeDataBinder >> reset [
	super reset.

	nodeElement := nil.
	itemObject := nil.
	treeNode := nil
]

{ #category : #accessing }
BrTreeNodeDataBinder >> treeNode [
	<return: #BrTreeNode>

	^ treeNode
]

{ #category : #accessing }
BrTreeNodeDataBinder >> treeNode: aBrTreeNode [
	treeNode := aBrTreeNode
]
