Class {
	#name : #BrColumnCellStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'rowIndex',
		'columnIndex',
		'rowValue'
	],
	#category : #'Brick-Column - Stencil'
}

{ #category : #'api - instantiation' }
BrColumnCellStencilBuilder >> buildDefault [
	^ BrColumnCellLabelStencil new text: self rowValue asRopedText
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

{ #category : #'api - instantiation' }
BrColumnCellStencilBuilder >> paramsOn: aStencilExecutor [

	aStencilExecutor
		push: self rowValue;
		push: self rowIndex;
		push: self columnIndex
]

{ #category : #accessing }
BrColumnCellStencilBuilder >> rowIndex [
	<return: #Number>

	^ rowIndex
]

{ #category : #accessing }
BrColumnCellStencilBuilder >> rowIndex: aNumber [
	rowIndex := aNumber
]

{ #category : #accessing }
BrColumnCellStencilBuilder >> rowValue [
	^ rowValue
]

{ #category : #accessing }
BrColumnCellStencilBuilder >> rowValue: anObject [
	rowValue := anObject
]
