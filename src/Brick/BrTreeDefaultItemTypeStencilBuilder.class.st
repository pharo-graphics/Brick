Class {
	#name : #BrTreeDefaultItemTypeStencilBuilder,
	#superclass : #BrTreeNodeTypeStencilBuilder,
	#category : #'Brick-Tree - Stencil'
}

{ #category : #'api - instantiation' }
BrTreeDefaultItemTypeStencilBuilder >> buildDefault [
	<return: #BrStencil or: #BlElement>

	^ BrListItemType default
]
