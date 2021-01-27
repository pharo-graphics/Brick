"
I am a stencil builder that defines a general api of the object that should compute the id of a node in the tree.
"
Class {
	#name : #BrTreeNodeIdStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'itemPosition',
		'itemObject'
	],
	#category : #'Brick-Tree - Stencil'
}

{ #category : #'api - instantiation' }
BrTreeNodeIdStencilBuilder >> buildDefault [
	<return: #BrStencil or: #BlElement>

	^ BlInfiniteDataSource noId
]

{ #category : #accessing }
BrTreeNodeIdStencilBuilder >> itemNode [
	^ itemObject
]

{ #category : #accessing }
BrTreeNodeIdStencilBuilder >> itemNode: anObject [
	itemObject := anObject
]

{ #category : #accessing }
BrTreeNodeIdStencilBuilder >> itemPosition [
	^ itemPosition
]

{ #category : #accessing }
BrTreeNodeIdStencilBuilder >> itemPosition: anObject [
	itemPosition := anObject
]

{ #category : #'api - instantiation' }
BrTreeNodeIdStencilBuilder >> paramsOn: aStencilExecutor [
	aStencilExecutor
		push: self itemNode;
		push: self itemPosition
]

{ #category : #initialization }
BrTreeNodeIdStencilBuilder >> reset [
	super reset.

	itemPosition := nil.
	itemObject := nil
]
