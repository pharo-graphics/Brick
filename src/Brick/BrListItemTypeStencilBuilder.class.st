"
I am a stencil builder that defines a general api of the object that should compute the type of an item in the list.
"
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

	^ BrListItemType invalid
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
