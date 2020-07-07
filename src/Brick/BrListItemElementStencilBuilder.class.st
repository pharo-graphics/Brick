Class {
	#name : #BrListItemElementStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'itemType',
		'listElement'
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

{ #category : #accessing }
BrListItemElementStencilBuilder >> listElement [
	^ listElement
]

{ #category : #accessing }
BrListItemElementStencilBuilder >> listElement: anObject [
	listElement := anObject
]

{ #category : #'api - instantiation' }
BrListItemElementStencilBuilder >> paramsOn: aStencilExecutor [
	aStencilExecutor
		push: self itemType;
		push: self listElement
]

{ #category : #initialization }
BrListItemElementStencilBuilder >> reset [
	itemType := nil.
	listElement := nil
]
