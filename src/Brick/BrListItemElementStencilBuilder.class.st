"
I am responsible for creating an item element for a given item type
"
Class {
	#name : #BrListItemElementStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'itemType'
	],
	#category : #'Brick-List - Stencil'
}

{ #category : #'api - instantiation' }
BrListItemElementStencilBuilder >> buildDefault [
	<return: #BrStencil or: #BlElement>

	^ BlElement new
]

{ #category : #accessing }
BrListItemElementStencilBuilder >> itemType [
	^ itemType
]

{ #category : #accessing }
BrListItemElementStencilBuilder >> itemType: anObject [
	itemType := anObject
]

{ #category : #'api - instantiation' }
BrListItemElementStencilBuilder >> paramsOn: aStencilExecutor [
	aStencilExecutor
		push: self itemType
]

{ #category : #initialization }
BrListItemElementStencilBuilder >> reset [
	itemType := nil
]
