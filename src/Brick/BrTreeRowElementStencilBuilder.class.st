Class {
	#name : #BrTreeRowElementStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'itemType'
	],
	#category : #'Brick-Tree - Stencil'
}

{ #category : #accessing }
BrTreeRowElementStencilBuilder >> itemType [
	^ itemType
]

{ #category : #accessing }
BrTreeRowElementStencilBuilder >> itemType: anObject [
	itemType := anObject
]

{ #category : #'api - instantiation' }
BrTreeRowElementStencilBuilder >> paramsOn: aStencilExecutor [

	aStencilExecutor
		push: self itemType
]

{ #category : #initialization }
BrTreeRowElementStencilBuilder >> reset [
	super reset.
	
	itemType := nil
]
