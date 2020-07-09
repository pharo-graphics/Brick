Class {
	#name : #BrColumnCellStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'itemType',
		'column',
		'columnIndex'
	],
	#category : #'Brick-Column - Stencil'
}

{ #category : #'api - instantiation' }
BrColumnCellStencilBuilder >> buildDefault [
	^ BlElement new
]

{ #category : #accessing }
BrColumnCellStencilBuilder >> column [
	^ column
]

{ #category : #accessing }
BrColumnCellStencilBuilder >> column: anObject [
	column := anObject
]

{ #category : #accessing }
BrColumnCellStencilBuilder >> columnIndex [
	<return: #Number>

	^ columnIndex
]

{ #category : #accessing }
BrColumnCellStencilBuilder >> columnIndex: aNumber [
	columnIndex := aNumber
]

{ #category : #accessing }
BrColumnCellStencilBuilder >> itemType [
	^ itemType
]

{ #category : #accessing }
BrColumnCellStencilBuilder >> itemType: anObject [
	itemType := anObject
]

{ #category : #'api - instantiation' }
BrColumnCellStencilBuilder >> paramsOn: aStencilExecutor [

	aStencilExecutor
		push: self itemType;
		push: self column;
		push: self columnIndex
]

{ #category : #initialization }
BrColumnCellStencilBuilder >> reset [
	itemType := nil.
	column := nil.
	columnIndex := nil.
]
