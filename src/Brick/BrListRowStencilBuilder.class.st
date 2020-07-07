Class {
	#name : #BrListRowStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'rowIndex',
		'rowValue',
		'listElement'
	],
	#category : #'Brick-List - Stencil'
}

{ #category : #accessing }
BrListRowStencilBuilder >> listElement [
	^ listElement
]

{ #category : #accessing }
BrListRowStencilBuilder >> listElement: anObject [
	listElement := anObject
]

{ #category : #'api - instantiation' }
BrListRowStencilBuilder >> paramsOn: aStencilExecutor [

	aStencilExecutor
		push: self rowValue;
		push: self rowIndex;
		push: self listElement
]

{ #category : #initialization }
BrListRowStencilBuilder >> reset [
	listElement := nil.
	rowValue := nil.
	rowIndex := nil
]

{ #category : #accessing }
BrListRowStencilBuilder >> rowIndex [
	^ rowIndex
]

{ #category : #accessing }
BrListRowStencilBuilder >> rowIndex: anObject [
	rowIndex := anObject
]

{ #category : #accessing }
BrListRowStencilBuilder >> rowValue [
	^ rowValue
]

{ #category : #accessing }
BrListRowStencilBuilder >> rowValue: anObject [
	rowValue := anObject
]
