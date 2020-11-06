"
I am a stencil builder that defines a general api of the object that should compute the id of an item in the list.
"
Class {
	#name : #BrListItemIdStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'itemPosition',
		'itemObject'
	],
	#category : #'Brick-List - Stencil'
}

{ #category : #'api - instantiation' }
BrListItemIdStencilBuilder >> buildDefault [
	<return: #BrStencil or: #BlElement>

	^ BrListItemType invalid
]

{ #category : #accessing }
BrListItemIdStencilBuilder >> itemObject [
	^ itemObject
]

{ #category : #accessing }
BrListItemIdStencilBuilder >> itemObject: anObject [
	itemObject := anObject
]

{ #category : #accessing }
BrListItemIdStencilBuilder >> itemPosition [
	^ itemPosition
]

{ #category : #accessing }
BrListItemIdStencilBuilder >> itemPosition: anObject [
	itemPosition := anObject
]

{ #category : #'api - instantiation' }
BrListItemIdStencilBuilder >> paramsOn: aStencilExecutor [
	aStencilExecutor
		push: self itemObject;
		push: self itemPosition
]

{ #category : #initialization }
BrListItemIdStencilBuilder >> reset [
	itemPosition := nil.
	itemObject := nil
]
