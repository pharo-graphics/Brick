Class {
	#name : #BrTreeNodeElementStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'itemType'
	],
	#category : #'Brick-Tree - Stencil'
}

{ #category : #'api - instantiation' }
BrTreeNodeElementStencilBuilder >> buildDefault [
	<return: #BrStencil or: #BlElement>

	^ BlElement new
]

{ #category : #accessing }
BrTreeNodeElementStencilBuilder >> itemType [
	^ itemType
]

{ #category : #accessing }
BrTreeNodeElementStencilBuilder >> itemType: anObject [
	itemType := anObject
]

{ #category : #'api - instantiation' }
BrTreeNodeElementStencilBuilder >> paramsOn: aStencilExecutor [
	aStencilExecutor
		push: self itemType
]

{ #category : #initialization }
BrTreeNodeElementStencilBuilder >> reset [
	itemType := nil
]
