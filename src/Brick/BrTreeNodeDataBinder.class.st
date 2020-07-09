"
I define the api of an object that should bind the actual node data to the reused node element
"
Class {
	#name : #BrTreeNodeDataBinder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'nodeElement',
		'itemObject',
		'itemPosition'
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
BrTreeNodeDataBinder >> itemPosition [
	<return: #Number>

	^ itemPosition
]

{ #category : #accessing }
BrTreeNodeDataBinder >> itemPosition: aNumber [
	itemPosition := aNumber
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
		push: self itemPosition
]

{ #category : #initialization }
BrTreeNodeDataBinder >> reset [
	super reset.

	nodeElement := nil.
	itemObject := nil.
	itemPosition := nil
]
