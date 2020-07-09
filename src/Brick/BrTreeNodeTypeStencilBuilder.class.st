"
I am a stencil builder that defines a general api of the object that should compute the type of a node in the tree.
"
Class {
	#name : #BrTreeNodeTypeStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'itemPosition',
		'itemObject'
	],
	#category : #'Brick-Tree - Stencil'
}

{ #category : #'api - instantiation' }
BrTreeNodeTypeStencilBuilder >> buildDefault [
	<return: #BrStencil or: #BlElement>

	^ BrListItemType invalid
]

{ #category : #accessing }
BrTreeNodeTypeStencilBuilder >> itemNode [
	^ itemObject
]

{ #category : #accessing }
BrTreeNodeTypeStencilBuilder >> itemNode: anObject [
	itemObject := anObject
]

{ #category : #accessing }
BrTreeNodeTypeStencilBuilder >> itemPosition [
	^ itemPosition
]

{ #category : #accessing }
BrTreeNodeTypeStencilBuilder >> itemPosition: anObject [
	itemPosition := anObject
]

{ #category : #'api - instantiation' }
BrTreeNodeTypeStencilBuilder >> paramsOn: aStencilExecutor [
	aStencilExecutor
		push: BrListItemType;
		push: self itemNode;
		push: self itemPosition
]

{ #category : #initialization }
BrTreeNodeTypeStencilBuilder >> reset [
	super reset.

	itemPosition := nil.
	itemObject := nil
]
