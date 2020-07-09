Class {
	#name : #BrTreeRowDataBinder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'rowElement',
		'itemNode',
		'itemPosition'
	],
	#category : #'Brick-Tree - Stencil'
}

{ #category : #'api - instantiation' }
BrTreeRowDataBinder >> buildDefault [
	<return: #BrStencil or: #BlElement>

	^ nil
]

{ #category : #accessing }
BrTreeRowDataBinder >> itemNode [
	^ itemNode
]

{ #category : #accessing }
BrTreeRowDataBinder >> itemNode: anObject [
	itemNode := anObject
]

{ #category : #accessing }
BrTreeRowDataBinder >> itemPosition [
	^ itemPosition
]

{ #category : #accessing }
BrTreeRowDataBinder >> itemPosition: anObject [
	itemPosition := anObject
]

{ #category : #'api - instantiation' }
BrTreeRowDataBinder >> paramsOn: aStencilExecutor [
	aStencilExecutor
		push: self rowElement;
		push: self itemNode;
		push: self itemPosition
]

{ #category : #initialization }
BrTreeRowDataBinder >> reset [
	super reset.
	
	rowElement := nil.
	itemNode := nil.
	itemPosition := nil
]

{ #category : #accessing }
BrTreeRowDataBinder >> rowElement [
	^ rowElement
]

{ #category : #accessing }
BrTreeRowDataBinder >> rowElement: anObject [
	rowElement := anObject
]
