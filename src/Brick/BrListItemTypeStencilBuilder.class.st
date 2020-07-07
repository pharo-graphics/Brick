Class {
	#name : #BrListItemTypeStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'itemPosition',
		'itemObject'
	],
	#category : #'Brick-List - Stencil'
}

{ #category : #'api - instantiation' }
BrListItemTypeStencilBuilder >> buildDefault [
	<return: #BrStencil or: #BlElement>

	^ BlInfiniteItemType invalid
]

{ #category : #accessing }
BrListItemTypeStencilBuilder >> itemObject [
	^ itemObject
]

{ #category : #accessing }
BrListItemTypeStencilBuilder >> itemObject: anObject [
	itemObject := anObject
]

{ #category : #accessing }
BrListItemTypeStencilBuilder >> itemPosition [
	^ itemPosition
]

{ #category : #accessing }
BrListItemTypeStencilBuilder >> itemPosition: anObject [
	itemPosition := anObject
]

{ #category : #'api - instantiation' }
BrListItemTypeStencilBuilder >> paramsOn: aStencilExecutor [
	aStencilExecutor
		push: BrListItemType;
		push: self itemObject;
		push: self itemPosition
]

{ #category : #initialization }
BrListItemTypeStencilBuilder >> reset [
	itemPosition := nil.
	itemObject := nil
]
