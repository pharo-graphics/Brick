Class {
	#name : #BrColumnedListCellStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'rowIndex',
		'columnIndex',
		'rowValue'
	],
	#category : 'Brick-List - Support'
}

{ #category : #'api - instantiation' }
BrColumnedListCellStencilBuilder >> buildDefault [
	^ BrListLabelStencil new text: self rowValue asRopedText
]

{ #category : #accessing }
BrColumnedListCellStencilBuilder >> columnIndex [
	<return: #Number>

	^ columnIndex
]

{ #category : #accessing }
BrColumnedListCellStencilBuilder >> columnIndex: aNumber [
	columnIndex := aNumber
]

{ #category : #'api - instantiation' }
BrColumnedListCellStencilBuilder >> paramsOn: aStencilExecutor [

	aStencilExecutor
		push: self rowValue;
		push: self rowIndex;
		push: self columnIndex
]

{ #category : #accessing }
BrColumnedListCellStencilBuilder >> rowIndex [
	<return: #Number>

	^ rowIndex
]

{ #category : #accessing }
BrColumnedListCellStencilBuilder >> rowIndex: aNumber [
	rowIndex := aNumber
]

{ #category : #accessing }
BrColumnedListCellStencilBuilder >> rowValue [
	^ rowValue
]

{ #category : #accessing }
BrColumnedListCellStencilBuilder >> rowValue: anObject [
	rowValue := anObject
]
