Class {
	#name : #BrListItemDataUnbinder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'itemPosition',
		'itemObject',
		'itemElement'
	],
	#category : #'Brick-List - Stencil'
}

{ #category : #'api - instantiation' }
BrListItemDataUnbinder >> buildDefault [
	<return: #BrStencil or: #BlElement>

	^ itemElement
]

{ #category : #accessing }
BrListItemDataUnbinder >> itemElement [
	^ itemElement
]

{ #category : #accessing }
BrListItemDataUnbinder >> itemElement: anObject [
	itemElement := anObject
]

{ #category : #accessing }
BrListItemDataUnbinder >> itemObject [
	^ itemObject
]

{ #category : #accessing }
BrListItemDataUnbinder >> itemObject: anObject [
	itemObject := anObject
]

{ #category : #accessing }
BrListItemDataUnbinder >> itemPosition [
	^ itemPosition
]

{ #category : #accessing }
BrListItemDataUnbinder >> itemPosition: anObject [
	itemPosition := anObject
]

{ #category : #'api - instantiation' }
BrListItemDataUnbinder >> paramsOn: aStencilExecutor [
	aStencilExecutor
		push: self itemElement;
		push: self itemObject;
		push: self itemPosition
]

{ #category : #initialization }
BrListItemDataUnbinder >> reset [
	itemObject := nil.
	itemPosition := nil.
	itemElement := nil
]
